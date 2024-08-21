import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes_name.dart';

class HomeController extends GetxController {
  // Reactive variable to hold the greeting
  var greeting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the greeting when the controller is initialized
    greeting.value = getGreeting();
  }

  String getGreeting() {
    // Get the current hour
    final hour = DateTime.now().hour;

    // Determine the greeting based on the hour
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  // Define a list of items to display
  final List<Map<String, dynamic>> items = [
    {
      'label': 'To-Do',
      'icon': Icons.assignment,
      'color': Colors.red,
      'bgColor': Color(0xfff3c8d9),
    },
    {
      'label': 'Progress',
      'icon': Icons.assignment_late,
      'color': Color(0xfffdc00c),
      'bgColor': Color(0xfff7eac4),
    },
    {
      'label': 'Done',
      'icon': Icons.assignment_turned_in,
      'color': Color(0xff4dae50),
      'bgColor': Color(0xffd2e6d3),
    },
     {
      'label': 'Favorite',
      'icon': Icons.favorite,
      'color': Colors.red,
      'bgColor': Color(0xfff3c8d9),
    },
  ];


 void getCreate() {
    Get. toNamed(AppRoutesName.create_task);
   }

}
