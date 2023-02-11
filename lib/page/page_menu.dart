import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메뉴화면'),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: ElevatedButton.icon(
                onPressed: () => Get.back(),
                label: const Text('메인 화면으로 GO !'),
                icon: const Icon(
                  Icons.access_alarm,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
