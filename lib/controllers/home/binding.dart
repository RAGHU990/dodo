import 'package:dodo/controllers/home/controller.dart';
import 'package:get/get.dart';


class HomePageBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<HomeController>(() => HomeController());
     
  }
}