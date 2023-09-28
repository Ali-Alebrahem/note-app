
import 'package:course_getx/components/addnote.dart';

import 'package:course_getx/components/favorites.dart';
import 'package:course_getx/components/homee.dart';
import 'package:course_getx/components/signinn.dart';
import 'package:course_getx/components/signupp.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';




void main()  {
 
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Course PHP,',
      home:  Scaffold(backgroundColor: Colors.white,
        body:signinn()) );
      
      
    
      ;}}
     