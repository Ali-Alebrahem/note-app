import 'dart:convert';
import 'dart:ffi';
import 'package:course_getx/components/addnote.dart';
import 'package:course_getx/components/favorites.dart';
import 'package:course_getx/constant/notacontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:course_getx/components/curd.dart';
import 'package:course_getx/constant/customtext.dart';
import 'package:course_getx/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});
  

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
    final controller=Get.put(notecontroller());
  
  Crud _crud=new Crud();

  

@override
void initState(){
  super.initState();
  controller.shownotes();
 
}



  @override
  Widget build(BuildContext context) {
   RxList search=[].obs;
   TextEditingController searchco=TextEditingController();
    return Scaffold(appBar: AppBar(title: Text("Your Notes"),centerTitle: true,backgroundColor: Color.fromARGB(255, 54, 73, 244,),),
      floatingActionButton: FloatingActionButton(onPressed: () {
      Get.to(addnot());
      },
      
      backgroundColor: Color.fromARGB(255, 54, 73, 244),
      child: Icon(Icons.add_task),),
    
   body:Column(children: [
      SizedBox(height: 20,),

    
      Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Row(
          children: [
          Expanded(
                child: TextFormField(
                   controller:searchco,

    onChanged: ((searchco) {
    
         controller.searcht({'note_title':searchco});
   
     
    }),
                  decoration:InputDecoration(
                filled: true,
                fillColor:Color.fromARGB(255, 243, 241, 241),
                prefixIcon: Icon(Icons.search),
                 suffixIcon:IconButton(onPressed: () {searchco.clear();},icon: Icon(Icons.close,color: Colors.black,),),
               //  suffixIcon: IconButton(icon: Icon(Icons.close ),onPressed: (){},),
                  hintText: "Search In Your Notes",
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(30),),

                )),
              
            ),
            SizedBox(width: 7,),
            InkWell(onTap: (){Get.to(favorites());},
              child: Container(width: 70,height: 55,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
               color: Color.fromARGB(255, 243, 241, 241),
               border: Border.all(color: Colors.black)
              ),child:Icon(Icons.favorite,color: Color.fromARGB(255, 255, 0, 0),)),
            ),  SizedBox(width: 7,),
             Container(width: 70,height: 55,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
             color: Color.fromARGB(255, 243, 241, 241),
             border: Border.all(color: Colors.black)
            ),child:Icon(Icons.delete,color: Colors.red,))
          
          ],
        ),
      ),
    
     
     
   //  ),),
     SizedBox(height: 30,),

    Align(alignment: Alignment.centerLeft,child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text("*  All Notes ..",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 116, 113, 113),),),
    )),
    SizedBox(height: 10,),
     
     Expanded(
         child: Padding(
           padding: const EdgeInsets.only(bottom: 80),
           child:Obx(()=>controller.data.isEmpty? Lottie.asset("assets/lottie/note.json",width: 270,height: 270)  : GridView.builder(
            
 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.5,
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 6.0,
            maxCrossAxisExtent: 200
        
      ),
  
   
   itemCount:controller.searchtlist.isEmpty? controller.data.length:controller.searchtlist.length,
  itemBuilder: (BuildContext context, int index) {
  final list=controller.searchtlist.isEmpty? controller.data[index]:controller.searchtlist[index];
    
    return   Padding(
      padding: EdgeInsets.all(5),
      child:Container(
      
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),gradient:const LinearGradient(colors: [
    Color.fromARGB(255, 80, 126, 250),
                Color.fromARGB(255, 191, 197, 255),
               Color.fromARGB(255, 146, 175, 255),
               
      ]),
     
           boxShadow: [
    BoxShadow(

color: Color.fromARGB(255, 250, 248, 248).withOpacity(0.1),
spreadRadius: 3.0,
blurRadius: 5.0,

    ),
  ],
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      child: Column(
           children: [
             ListTile(title:Text("# ${list['title']}..",style: TextStyle(fontWeight:FontWeight.bold ),),
             subtitle: Text("${list['name']}",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 17),),),
             SizedBox(height:40 ,),
            Expanded(
            child: Stack(
              children: [
                InkWell(onTap: (){
                  showDialog(context: context, builder:(context) {
                    return AlertDialog(contentPadding: EdgeInsets.all(5), backgroundColor: Color.fromARGB(255, 172, 170, 170),content:Container(
                     width: 250,
                     height: 400,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(22))
                      ,child: Image.network("$LinkImageRoot/${ list['image']}",fit: BoxFit.fitWidth,)) );
                  });
                  
                },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        
                         image:NetworkImage("$LinkImageRoot/${ list['image']}") ,
                      fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
  
     
       ]),
            ),

           
                    Row(
                children: [
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child:Container(width: 35,height: 35,decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  
                 color: Color.fromARGB(255, 105, 44, 247)
                 ),
                  
                  child:InkWell(onTap: (){ if(controller.fav.contains(list)){ setState(() {
                    controller.removefromfav(list);
                    
                  
                  });}
                  else{setState(() {
                    controller.addtofav(list);
             
                  });
                  
                  
                    }  },
                    child: Icon(Icons.favorite,color:controller.fav.contains(list)? Color.fromARGB(255, 155, 0, 0):Color.fromARGB(255, 255, 255, 255),size: 24,)))
                  ), 
                  SizedBox(width: 10,),

                    Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child:Container(width: 35,height: 35,decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  
                 color: Color.fromARGB(255, 1, 134, 12)
                 ),
                  
                  child: Icon(Icons.edit,color: Color.fromARGB(255, 255, 255, 255),size: 24,)),
                  ), 
                  SizedBox(width: 10,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(onTap: (){

                    setState(() {
                      controller.deletenote("${list['id']}","${ list['image']}" );
                      controller.removefromfav(list);
                      controller.searchtlist.remove(list);
                     
                    });
                    

                 },
                   child: Container(width: 35,height: 35,decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    
                   color: Color.fromARGB(255, 0, 0, 0)
                   ),
                    
                    child: Icon(Icons.delete,color: Color.fromARGB(255, 255, 255, 255),size: 24,)),
                 ),
               )
                ],
              ),
                        
            ])));
  }
   ),
         )))]));
    
  } 
  
  }
