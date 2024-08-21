import 'package:dodo/controllers/login/binding.dart';
import 'package:dodo/routes/routes_name.dart';
import 'package:dodo/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutesName.login,
      initialBinding: LoginBinding(), // Set the initial route
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'dodo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
