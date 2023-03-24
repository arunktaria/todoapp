
import 'package:get/get.dart';
import 'package:todoapp/GetxLogin.dart';

class MainBindingshelper extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => GetxLogin());
  }


}