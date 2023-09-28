import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_getx/components/curd.dart';
import 'package:course_getx/components/homee.dart';
import 'package:course_getx/components/signupp.dart';
import 'package:course_getx/components/valid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../constant/customtext.dart';
import '../constant/linkapi.dart';

class signinn extends StatefulWidget  {
  const signinn({super.key});

  @override
  State<signinn> createState() => _signinnState();
}

class _signinnState extends State<signinn> with Crud{
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

loginnow() async{
  if(formstate.currentState!.validate()){
var response= await postRequest(LinkLogin, {
'email':email.text,
'password':password.text

});
if(response['status']=="successful") {print("helllo wwwpoot");Get.off(Homee());}
 else{AwesomeDialog (
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: 'Login Faild',
            desc: 'your account is not registered..try again ',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();}
  }
  else { print("errrrrrrrror");}
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SignIn"),centerTitle: true,),
    body: SingleChildScrollView(
      child: Form(key: formstate,
        child: Column(children: [
          SizedBox(height: 30,),
         Center(child: Image.asset("assets/images/si.jpg",width: 400,height: 200,)),
          SizedBox(height: 40,),
          Align(alignment: Alignment.centerLeft,child:
         Padding(
           padding: const EdgeInsets.only(
            left: 20
           ),
           child: Text("Sign In Now",style: TextStyle(fontSize: 22,color: Colors.grey,),
         ),)), SizedBox(height: 20,),
    
   CustomTextField(hint: "Enter Your Email",icon:Icon(Icons.email,
   color: Color.fromARGB(255, 89, 54, 244)),
   color: Color.fromARGB(255, 245, 243, 243),mycontroller: email,
   
   valid: (val) {
     return validinput(val!,5, 30);
   }),
   
   
   SizedBox(height: 25,),
   CustomTextField(hint: "Enter Your Password",
   icon:Icon(Icons.password,color:  Color.fromARGB(255, 89, 54, 244),),
   color: Color.fromARGB(255, 245, 243, 243),mycontroller: password,
   valid: (val) {
     return validinput(val!, 5, 30);
   }),
   
   

  
   SizedBox(height: 33,),
  ElevatedButton(onPressed: () async{
await loginnow();
 

  }, child: Text("       Sign In       "),style:ElevatedButton.styleFrom(
        shadowColor: Color.fromARGB(255, 180, 13, 13),

  ),

),

SizedBox(height: 30,),
Padding(
  padding: const EdgeInsets.only(left: 20),
  child:   Row(
  
    children: [
            
  
            Text("* if you dont have an account you can",style: TextStyle(color: Colors.black,fontSize: 15),),
  
            InkWell(onTap: (() {
  Get.off(Signupp());
              
  
            }),
  
            child: Text("SignUp",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline),),)
  
    ],
  
  ),
)

        ]),
      ),
    ),
    );
  }
}
  
