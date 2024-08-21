import 'dart:math';

import 'package:dodo/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../database/db_connection.dart';
import '../../widgets/picker.dart';
import '../../widgets/snackbar.dart';

class CreateTaskController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final RxString _selectedDate = "".obs;
  late final RxString _selectedTime = "".obs;
  final RxInt selectedIndex = (-1).obs;
  var selectedColor = Colors.transparent.obs;
  final RxList<Map<String, dynamic>> taskData = <Map<String, dynamic>>[].obs;

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController description = TextEditingController();
  final List<Tasks> taskList = [];

  get color => selectedColor.value;

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  String get selectedDate => _selectedDate.value.isNotEmpty
      ? _selectedDate.value
      : DateFormat("dd-MM-yyyy").format(DateTime.now());
  String get selectedTime => _selectedTime.value.isNotEmpty
      ? _selectedTime.value
      : TimeOfDay.now().format(Get.context!);

  void selectDate(BuildContext context) async {
    DateTime? date = await showCustomDatePicker(context);
    if (date != null) {
      _selectedDate.value = DateFormat('dd-MM-yyyy').format(date);
      update();
    }
  }

  void selectTime(BuildContext context) async {
    TimeOfDay? time = await showCustomTimePicker(context);
    if (time != null) {
      // ignore: use_build_context_synchronously
      _selectedTime.value = time.format(context);
      update();
    }
  }

  void updateSelectedColor(Color color) {
    selectedColor.value = color; // Update the selected color
    print(color);
  }

  getBack() {
    Get.back();
  }

  List<Color> generateRandomLightColors(int count) {
    final Random random = Random();
    List<Color> lightColors = [];

    for (int i = 0; i < count; i++) {
      // Generate random RGB values that are higher to ensure light colors
      int red = random.nextInt(156) + 100; // Range: 100 to 255
      int green = random.nextInt(156) + 100; // Range: 1000 to 255
      int blue = random.nextInt(156) + 100; // Range: 100 to 255

      lightColors.add(Color.fromARGB(255, red, green, blue));
    }

    return lightColors;
  }

  // taskDatam() async {
  //   // Create a map to hold task data without the ID
  //   Tasks newTask = Tasks(
  //     task_title: taskTitleController.text,
  //     date: _selectedDate.value,
  //     time: _selectedTime.value,
  //     description: description.text,
  //     color: selectedColor.value.toString(),
  //   );

  //   // Insert the new task into the database
  //   await _databaseHelper.insertTask(newTask);
  //   taskTitleController.clear();
  //   description.clear();
  //   _selectedDate.value = DateFormat("dd-mm-yyyy").format(DateTime.now());
  //   _selectedTime.value = TimeOfDay.now().format(Get.context!);
  //   selectedColor.value = Colors.transparent;
  //   print("DATA INSERTED SUCCESS ");
  // }

  void taskDatam() async {
    // Validate input fields
    if (taskTitleController.text.isEmpty) {
      showCustomSnackBar("Task title cannot be empty.");

      return; // Exit the method if the title is empty
    }

    if (_selectedDate.value.isEmpty) {
      showCustomSnackBar("Date cannot be empty.");
      return; // Exit the method if the date is empty
    }

    if (_selectedTime.value.isEmpty) {
      showCustomSnackBar("Time cannot be empty.");
      return; // Exit the method if the time is empty
    }

    if (description.text.isEmpty) {
      showCustomSnackBar("Description cannot be empty.");
      return; // Exit the method if the description is empty
    }

    if (selectedColor.value == Colors.transparent) {
      showCustomSnackBar("Color must be selected.");
      return; // Exit the method if no color is selected
    }

    // Create an instance of the Tasks model
    Tasks newTask = Tasks(
      task_title: taskTitleController.text,
      date: _selectedDate.value,
      time: _selectedTime.value,
      description: description.text,
      color: color, // Convert color to string
    );

    // Print the model instance (optional)
    debugPrint("Creating new task: $newTask");

    // Insert the new task into the database using the userMap method
    await _databaseHelper.insertTask(newTask);

    // Clear the input fields after insertion
    taskTitleController.clear();
    description.clear();

    // Reset the selected date and time
    _selectedDate.value = DateFormat("dd-MM-yyyy")
        .format(DateTime.now()); // Ensure _selectedDate is a String
    _selectedTime.value = TimeOfDay.now()
        .format(Get.context!); // Use format to get a String representation

    // Reset the selected color (if using Color)
    selectedColor.value =
        Colors.transparent; // Assuming selectedColor is a Color variable
  }

  void getAllData() async {
    List<Tasks> tasklist = await _databaseHelper.getTasks();

    print("${tasklist}");
    // await _databaseHelper.truncateTasks();
  }
}
