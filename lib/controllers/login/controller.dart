import 'package:dodo/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../validations/validations.dart';

class LoginPageController extends GetxController {
  final TextEditingController mobileController = TextEditingController();
  var borderColor = Colors.black.obs; // Reactive variable for border color

  @override
  void onInit() {
    super.onInit();
    // Add a listener to the mobileController
    mobileController.addListener(_validateMobile);
  }

  @override
  void onClose() {
    mobileController.dispose(); // Dispose of the controller
    super.onClose();
  }

  void _validateMobile() {
    String? validationMessage = Validator.validateMobile(mobileController.text);
    // Change border color based on validation
    if (validationMessage != null) {
      borderColor.value = Colors.red; // Invalid input
    } else {
      borderColor.value = Colors.black; // Valid input
    }
  }

  void login() {
    // Add your login logic here
    if (Validator.validateMobile(mobileController.text) == null) {
      // Proceed with login
      print("Mobile number is valid: ${mobileController.text}");
    } else {
      // Handle invalid input
      print("Invalid mobile number");
    }
  }

  void getHome() {
    Get.toNamed(AppRoutesName.home);
  }
  
}