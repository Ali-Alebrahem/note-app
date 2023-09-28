
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?) valid;
  String hint;
final TextEditingController mycontroller;
   Widget ? icon;
   late Color color;
  // String? Function(String?) valid;
  CustomTextField({super.key,required this.hint,required this.icon,required this.color,required this.mycontroller,required this.valid});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 25,right: 25),child: TextFormField(
    controller: mycontroller,
    validator:valid ,
    style: TextStyle(color: Color.fromARGB(255, 89, 54, 244),
   
    ),
    decoration: InputDecoration(
      filled: true,
    fillColor: color,
    prefixIcon: icon,
      hintText: hint,
      hintStyle:TextStyle(color: Color.fromARGB(255, 175, 173, 173)),
     
     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
    ),
   // controller: mycontroller,
   // validator: valid,
    ),);
 
  }
}