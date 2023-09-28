import 'package:course_getx/constant/notacontroller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
abstract class bind extends Bindings{
 @override

void dependencies(){
  Get.lazyPut(()=>notecontroller());}
}