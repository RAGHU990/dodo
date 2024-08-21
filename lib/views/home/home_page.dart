import 'package:dodo/controllers/home/controller.dart';
import 'package:dodo/routes/routes_name.dart';
import 'package:dodo/utils/responsive.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "...||..|DoDo|..||...",
          style: GoogleFonts.signikaNegative(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) => CircleAvatar(
              backgroundColor: const Color(0xFFFEECB2),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFEECB2),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      drawer: _Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  '${controller.greeting.value}, Raghu!',
                  style: GoogleFonts.signikaNegative(
                      fontSize: 18.sp, color: const Color(0xff939292)),
                ),
              ),
              SizedBox(
                height: 0.7.hp,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "You Don't Have Tasks for this Month yet! ",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 22.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: "Create One",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xfffebf03), // Set the color to yellow
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.hp),
              _searchbar(),
              SizedBox(
                height: 4.hp,
              ),
              _three(controller),
              SizedBox(height: 2.5.hp),
              _tasks(),
              _tasksContainer(controller)
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color(0xfff4b9cd)),
          child: Center(
            child: Text(
              'YG Studio',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            // Handle navigation to Home
            Navigator.pop(Get.context!); // Close the drawer
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favorite'),
          onTap: () {
            // Handle navigation to Settings
            Navigator.pop(Get.context!); // Close the drawer
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Create Task'),
          onTap: () {
            // Handle navigation to Settings
            Navigator.pop(Get.context!); // Close the drawer
            Get.toNamed(AppRoutesName.create_task);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Handle navigation to Settings
            Navigator.pop(Get.context!); // Close the drawer
          },
        ),
      ],
    ),
  );
}

Widget _three(HomeController controller) {
  return SizedBox(
    height: 20.hp, // Adjust height as needed
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        final item = controller.items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () => {},
                child: Container(
                  width: 25.wp, // Adjust width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color(0XFFf4f5f4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          backgroundColor: item['color'],
                          radius: 30,
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: item['bgColor'],
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(item['icon']),
                              color: item['color'],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          item['label'],
                          style: GoogleFonts.signikaNegative(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _searchbar() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: 9.hp,
      width: 100.wp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0XFFf4f5f4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          // controller: controller,
          decoration: InputDecoration(
            hintText: "Search a task...",
            hintStyle: GoogleFonts.signikaNegative(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 14.sp), // Hint text color
            border: InputBorder.none, // No border
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 255, 166, 0),
                size: 30,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0), // Padding inside the text field
          ),
        ),
      ),
    ),
  );
}

Widget _tasks() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Tasks",
              style: GoogleFonts.signikaNegative(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                print("helo");
              },
              child: Text(
                "See All",
                style: GoogleFonts.signikaNegative(
                    color: Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _tasksContainer(HomeController controller) {
  return Column(
    children: [
      Container(
        height: 25.hp,
        width: 100.wp,
        decoration: BoxDecoration(
          color: Color(0Xffffe9a8),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "You Don't have tasks for today",
                  style: GoogleFonts.signikaNegative(
                      color: Colors.black, fontSize: 20.sp),
                ),
              )),
              // Text("Create a new task", style: TextStyle(fontSize: 16.sp))
              TextButton(
                  onPressed: () {
                    controller.getCreate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      "   Click Here to Create One ",
                      style: GoogleFonts.signikaNegative(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 39, 58)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    ],
  );
}
