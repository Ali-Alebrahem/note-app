import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_getx/components/curd.dart';
import 'package:course_getx/components/homee.dart';
import 'package:course_getx/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/notacontroller.dart';

class addnot extends StatefulWidget {
  const addnot({super.key});

  @override
  State<addnot> createState() => _addnotState();
}
class _addnotState extends State<addnot> with Crud {
 final controller=Get.put(notecontroller());
  File?myfile;
 


final TextEditingController title=new TextEditingController();
final TextEditingController des=new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text("Add Note "),centerTitle: true,),
    body:Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(children: [
       
        SizedBox(height: 70,),
       
      TextFormField(
        controller: title,
          decoration:InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 233, 233, 232),
          label:Text("Note Title"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
           floatingLabelStyle:TextStyle(color: Color.fromARGB(255, 12, 15, 192),fontSize: 16,fontWeight: FontWeight.bold) ,
           labelStyle: TextStyle(color: Color.fromARGB(255, 57, 54, 244),fontSize: 20,fontWeight: FontWeight.bold),
            border:OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
           SizedBox(height: 30,),
        
         TextFormField(
          controller: des,
          maxLength: 200,
          maxLines: 5,
          decoration:InputDecoration(
             filled: true,
            fillColor: Color.fromARGB(255, 233, 233, 232),
          label:Text("Note descreption"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
           floatingLabelStyle:TextStyle(color: Color.fromARGB(255, 12, 15, 192),fontSize: 16,fontWeight: FontWeight.bold) ,
           labelStyle: TextStyle(color: Color.fromARGB(255, 57, 54, 244),fontSize: 20,fontWeight: FontWeight.bold),
            border:OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
  SizedBox(height: 50,),


            Container(height: 50,width: 180,decoration: BoxDecoration(gradient:LinearGradient(colors:[
              Color.fromARGB(255, 82, 127, 252),
                Color.fromARGB(255, 135, 143, 250),
              Color.fromARGB(255, 172, 20, 248),
               Color.fromARGB(255, 217, 18, 235),
            ] ),
            borderRadius: BorderRadius.circular(30)
            ),
              child: TextButton(onPressed: (){
             showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
             context: context, builder: ((context)=> Container(
                  height: 200,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 189, 194, 255),
                    Color.fromARGB(255, 158, 164, 255),
                    Color.fromARGB(255, 205, 209, 255),
                    Color.fromARGB(255, 139, 147, 255),
                  ])),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                      child: InkWell(onTap: ()async {
                   XFile? xfile=await ImagePicker().pickImage(source: ImageSource.gallery);
                 myfile=File(xfile!.path);
                  },
                        child: Container(height: 40,decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 57, 110, 255),
                  Color.fromARGB(255, 117, 126, 253),
                Color.fromARGB(255, 172, 20, 248),
                 Color.fromARGB(255, 217, 18, 235),
                        ])
                          
                        ,borderRadius: BorderRadius.circular(30)),
                        width: double.infinity,
                  child:  Padding(padding: EdgeInsets.only(left: 35),child: Row(
                    children: [
                      Icon(Icons.picture_in_picture_rounded),
                      SizedBox(width: 15,),
                      Text("Chosse file from galorey",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                    ],
                  ))),
                      ),
                    ),
                     
                     
                      Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                      child: InkWell(onTap: () async{
                      XFile? xfile=await ImagePicker().pickImage(source: ImageSource.camera);
                     myfile=File(xfile!.path);
                  },
                        child: Container(height: 40,decoration: BoxDecoration(gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 57, 110, 255),
                  Color.fromARGB(255, 117, 126, 253),
                Color.fromARGB(255, 172, 20, 248),
                 Color.fromARGB(255, 217, 18, 235),
                        ])
                        ,borderRadius: BorderRadius.circular(30)),
                        width: double.infinity,
                  child: Padding(padding: EdgeInsets.only(left: 35),child:Row(
                    children: [
                      Icon(Icons.camera_alt),
                       SizedBox(width: 15,),
                      Text("Chosse file from camera",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                    ],
                  ))),
                      ),
                    ),
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close)) ]),
                )
              )
              
                
              );

              },
              
              child: Text("chosse file",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),)
,
SizedBox(height: 20,),


    Container(height: 50,width: 180,decoration: BoxDecoration(gradient:LinearGradient(colors:[
              Color.fromARGB(255, 82, 127, 252),
                Color.fromARGB(255, 135, 143, 250),
              Color.fromARGB(255, 172, 20, 248),
               Color.fromARGB(255, 217, 18, 235),
            ] ),
            borderRadius: BorderRadius.circular(30)
            ),
              child: TextButton(onPressed: () async {
           await controller.adddata(title.text,des.text,myfile!);
           AwesomeDialog (
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: 'Add Notes',
            desc: 'Your Note Added Successfuly',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
         

           }
              ,child: Text("Add Note",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),))
      ]),
    ) ,
    
    );
  }
}