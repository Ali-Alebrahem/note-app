
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_getx/components/curd.dart';
import 'package:course_getx/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class notecontroller extends GetxController with Crud {

RxBool isadd=false.obs;
RxList data=[].obs;
RxList fav=[].obs;
var filteredProducts = [].obs;
TextEditingController searchTextcontroller=TextEditingController();
  RxList searchtlist=[].obs;
Future shownotes()async{
  var res=await http.get(Uri.parse("http://10.0.2.2/coursephp/note/show.php"));
  var red=jsonDecode(res.body);
    data.assignAll(red);
   update();

}
 Future adddata(String x, String y,File myfile)async{
    if(myfile==null){print("your file is empty.................");}
 else{ var res=await postRequestWithFile("http://10.0.2.2/coursephp/note/addnote.php", {
    'title':x,
    'des':y,
    'userid':5.toString()
  
     
  }, myfile);
  print(res);

shownotes();

 }
   
  }

void addtofav(item){
  fav.add(item);
   isadd.value=true;
     update();
  
  }
  void removefromfav(item){
    fav.remove(item);
    isadd.value=false;
      update();
  }
  /*void issadded(item){
  iscontain.value=fav.contains(item);
  }
*/

Future deletenote(String x,String y)async {
  var res=await postRequest(LinkDeleteNotes,{
    'id':x,
    'imagename':y
  });
  

  shownotes();
    update();
}


Future searcht(Map x)async{
  var res=await http.post(Uri.parse("http://10.0.2.2/coursephp/note/searcht.php"),body:x);
  var red=jsonDecode(res.body);
    searchtlist.assignAll(red);
    update();
 

}}