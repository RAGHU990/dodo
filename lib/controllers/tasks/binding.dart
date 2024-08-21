import 'package:dodo/controllers/tasks/controller.dart';
import 'package:get/get.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(() => CreateTaskController());
  }
}
