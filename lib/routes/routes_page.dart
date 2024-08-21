import 'package:dodo/controllers/tasks/binding.dart';
import 'package:dodo/routes/routes_name.dart';
import 'package:dodo/views/tasks/create_task.dart';
import 'package:get/get.dart';
import '../controllers/home/binding.dart';
import '../controllers/login/binding.dart';
import '../views/home/home_page.dart';
import '../views/login/login_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutesName.login,
      page: () => const LoginPage(),
      binding: LoginBinding(), // Use binding for the login page
    ),
    GetPage(
      name: AppRoutesName.home,
      page: () => const HomePage(),
      binding: HomePageBinding(), 
    
    ),
    GetPage(name: AppRoutesName.create_task, page: () => const  CreateTaskPage(),
    binding: CreateTaskBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),)
  ];
}