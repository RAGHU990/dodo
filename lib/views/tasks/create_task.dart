import 'package:dodo/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/tasks/controller.dart';

class CreateTaskPage extends GetView<CreateTaskController> {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the controller using Get.find

    return Scaffold(
      backgroundColor: const Color(0xfffbfafb),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _Buttons(controller),
              SizedBox(height: 4.hp),
              _TaskTitle(),
              SizedBox(height: 1.hp),
              _taskTtileTextField(controller),
              SizedBox(height: 1.5.hp),
              _DateAndTimeTextField(context, controller),
              SizedBox(height: 1.5.hp),
              _Description(controller),
              SizedBox(height: 3.hp),
              _ColorPalletes(controller),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Buttons(CreateTaskController controller) {
  return Column(
    children: [
      SizedBox(height: 2.hp),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFFEECB2),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Call the getBack method from the controller
                controller.getBack();
              },
            ),
          ),
          SizedBox(
            height: 6.hp,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEECB2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                controller.taskDatam();
              },
              child: Text(
                "SAVE TASK",
                style: GoogleFonts.signikaNegative(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget _TaskTitle() {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Task Title",
          style: GoogleFonts.merienda(
              fontSize: 18.sp, fontWeight: FontWeight.bold),
        )
      ],
    ),
  ]);
}

Widget _taskTtileTextField(CreateTaskController controller) {
  return TextField(
    controller: controller.taskTitleController,
    decoration: InputDecoration(
      hintText: "Task Title",
      hintStyle: GoogleFonts.merienda(color: Colors.grey, fontSize: 12.sp),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffFFE9A8),
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffFFE9A8),
        ),
        borderRadius: BorderRadius.circular(16.0),
        // Optional: rounded corners
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffFFE9A8),
          width: 2.0, // Set the enabled border width
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _DateAndTimeTextField(
    BuildContext context, CreateTaskController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(
        () => _buildLabelledTextField(
            context, "Date", Icons.calendar_month, controller.selectedDate, () {
          controller.selectDate(context);
        }, controller.date),
      ),
      Obx(
        () => _buildLabelledTextField(
            context, "Time", Icons.access_alarm, controller.selectedTime, () {
          controller.selectTime(context);
        }, controller.time),
      ),
    ],
  );
}

Widget _buildLabelledTextField(
    BuildContext context,
    String label,
    IconData icon,
    String hint,
    VoidCallback onTap,
    TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.merienda(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 1.hp),
      SizedBox(
        width: 45.wp,
        child: TextField(
          controller: controller,
          readOnly: true,
          showCursor: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                GoogleFonts.merienda(color: Colors.grey, fontSize: 12.sp),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFFE9A8),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFFE9A8),
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFFE9A8),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget _Description(CreateTaskController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: GoogleFonts.merienda(
                fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 1.5.hp), // Adjust the height as needed
      Container(
        height: 30.hp,
        width: 100.wp,
        decoration: BoxDecoration(
          color: const Color(0xfffbfafb),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: const Color(0xffFFE9A8),
            width: 0.6.wp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.description,
                    maxLines: null, // Set a maximum number of lines
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Enter your text here..',
                      hintStyle: GoogleFonts.merienda(
                          color: Colors.grey, fontSize: 12.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget _ColorPalletes(CreateTaskController controller) {
  final List<Color> colors = controller.generateRandomLightColors(12);
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () {
                  controller.selectedIndex.value =
                      index; // Update the selected index
                  controller.updateSelectedColor(colors[index]);
                },
                child: Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade500,
                        radius: 22,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: colors[index],
                        ),
                      ),
                      if (controller.selectedIndex.value == index)
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
