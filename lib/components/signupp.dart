import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_getx/components/curd.dart';
import 'package:course_getx/components/homee.dart';
import 'package:course_getx/components/signinn.dart';
import 'package:course_getx/components/valid.dart';
import 'package:course_getx/constant/customtext.dart';
import 'package:course_getx/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Signupp extends StatefulWidget with Crud {
  const Signupp({super.key});

  @override
  State<Signupp> createState() => _SignuppState();
}



class _SignuppState extends State<Signupp> with Crud {
  GlobalKey<FormState> formstate=GlobalKey();
 Crud _crud = new Crud();
  TextEditingController name=TextEditingController();
   TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    
addusers(Map x) async {
  if(formstate.currentState!.validate()){
 
  setState(() {
    
  });
  var response=await postRequest(LinkSignUp, {
     'name' : name.text,
    'email' : email.text,
    'password' : password.text,
  });

 if(response['status']=="successful") {print("helllo wwwpoot");Get.to(signinn());}
 else{print("nooooooo login");}
  
  }
  
  else{print ("errrrrrrrrrooooooooooor");}
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SignUp"),centerTitle: true,),
    body: SingleChildScrollView(
      child: Form(key: formstate,
        child: Column(children: [
          SizedBox(height: 30,),
         Center(child: Image.asset("assets/images/si.jpg",width: 400,height: 200,)),
          SizedBox(height: 10,),
         Text("Welcome back!",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),), SizedBox(height: 10,),
          Text("Sign UP Existant Account Of Alures",style: TextStyle(fontSize: 18,color: Colors.grey),),
 SizedBox(height: 30,),
 CustomTextField(hint: "Enter Your Name",icon:Icon(Icons.person,color: Color.fromARGB(255, 89, 54, 244)),
color: Color.fromARGB(255, 245, 243, 243),mycontroller: name,
valid: (val){return validinput(val!, 5, 30);},
),
  
  
  SizedBox(height: 10,),
   CustomTextField(hint: "Enter Your Email",icon:Icon(Icons.email,
   color: Color.fromARGB(255, 89, 54, 244)),color: Color.fromARGB(255, 245, 243, 243),mycontroller: email,
   valid:(val){return validinput(val!,5 ,30 );} ,
   ),
  
  
  
   SizedBox(height: 10,),
   CustomTextField(hint: "Enter Your Password",icon:Icon(Icons.password
   ,color:  Color.fromARGB(255, 89, 54, 244),),color: Color.fromARGB(255, 245, 243, 243),mycontroller: password,
   valid: (val){return validinput(val! , 5, 30);},),
   SizedBox(height: 8,),
   Align(alignment: Alignment.centerRight,child: Padding(
         padding: const EdgeInsets.only(right: 16),
         child: Text("Forget Password?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),

   ),),
   SizedBox(height: 8,),
  ElevatedButton(onPressed: () async{
    
await addusers({});
      AwesomeDialog (
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: 'Successfully Registered',
            desc: 'your account has been successfuly registered.now you can login',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();     
  }, 
  
  child: Text("       Sign Up       "),style:ElevatedButton.styleFrom(
   
        shadowColor: Color.fromARGB(255, 180, 13, 13),
        

  ),

),
SizedBox(height: 10,),
 Text("Or Connect Using",style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 138, 137, 137)),),
 
SizedBox(height: 17,),

 Padding(
   padding: const EdgeInsets.only(left: 70),
   child: Row(children: [
        ElevatedButton(onPressed: (){}, child: Text("       Facebook       "),style:ElevatedButton.styleFrom(
          shadowColor: Color.fromARGB(255, 180, 13, 13)
        ),
),
SizedBox(width: 20,),
ElevatedButton(onPressed: (){Get.off(signinn());}, child: Text("       Google       "),style:ElevatedButton.styleFrom(
          shadowColor: Color.fromARGB(255, 180, 13, 13),backgroundColor: Colors.red

        ),

),
   ],),
 )
        ]),
      ),
    ),
    );
  }
}