import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_2/data/user.dart';
import 'package:my_getx_2/page/page_home.dart';
import 'package:my_getx_2/page/page_menu.dart';

void main() {
  initController;
  runApp(const MyApp());
}

final initController = Get.put(
  User(
    name: ''.obs,
    age: 0.obs,
    mobile: ''.obs,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/menu',
          page: () => const MenuPage(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
