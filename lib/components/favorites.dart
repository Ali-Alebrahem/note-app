import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constant/linkapi.dart';
import '../constant/notacontroller.dart';

class favorites extends StatefulWidget {
  const favorites({super.key});

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  
    final controller=Get.put(notecontroller());
  @override
  Widget build(BuildContext context) {
   // if(controller.fav.isEmpty){return Lottie.asset("assets/lottie/looo.json");}
   // else{
    return Scaffold(appBar: AppBar(title: Text("My Favorites"),centerTitle: true,),
     body: controller.fav.isEmpty?Center(child: Column(
       children: [
        SizedBox(height: 90,),
         Lottie.asset("assets/lottie/looo.json"),
         Text("Add Your Favorites Now....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
       ],
     ))  :Column(children: [
      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 80),
        child: Row(
          children: [
            Text("Your Favorites Here",style: TextStyle(fontSize: 24),),
            Icon(Icons.favorite,color: Colors.red,size: 30,)
          ],
        ),
      ),
      SizedBox(height:50,),
      Expanded(
        child:Obx(()=> ListView.builder(itemCount: controller.fav.length,itemBuilder: (context, index) {
            return Column(
              children: [
               
             
                Row(
                    children: [
                   // Container  (width: 30,height: 30,color:Colors.red,child: Icon(Icons.delete),),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7,right: 6),
                          child: Container(
                          
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient:LinearGradient(colors: [
                               Color.fromARGB(255, 82, 127, 252),
                        Color.fromARGB(255, 135, 143, 250),
              Color.fromARGB(255, 172, 20, 248),
               Color.fromARGB(255, 217, 18, 235),
                            ]),
                            border: Border.all(color: Colors.black))
                            ,width:double.infinity,height:80,
                                    
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: ListTile(title: Text("${controller.fav[index]['title']}",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 252, 255, 80)),),
                                       // subtitle: Text("${controller.fav[index]['name']}",style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 220, 255, 23),fontWeight: FontWeight.bold),),
                                          leading:  Container(width: 100,height: 100,
                                           decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red,
                                           image:DecorationImage(image:  NetworkImage("$LinkImageRoot/${ controller. fav[index]['image']}"),fit: BoxFit.cover)) ,
                                           ),
                                          
                                          ),
                                        )) 
                                    
                                             
                              
              ),
                      ), 
                      Container(width: 50,height: 50,child: Icon(Icons.delete,color: Colors.white,),
                        decoration:BoxDecoration(shape: BoxShape.circle,gradient: SweepGradient(colors: [
                          Color.fromARGB(255, 253, 30, 30),
                          Color.fromARGB(255, 247, 133, 133),
                          Color.fromARGB(255, 240, 49, 49)
                        ])),),
                      
                    ],
                  ),
                
              SizedBox(height: 10,)
              ]
     );
                }),
       )  )]
     ));
                            
        
                 
                
        }}