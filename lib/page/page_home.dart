import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_2/util/util.dart';

import '../data/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  User user = Get.find();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인화면'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: [
            Container(
              child: TextField(
                controller: nameController..text = user.name.value,
              ),
            ),
            Container(
              child: Obx(
                () => Text('이름 : ${user.name.value}'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: changeName,
                child: const Text('이름 변경'),
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/menu');
                  Util.showSnackBar(
                    title: '알림',
                    message: '메뉴 화면으로 GO !',
                  );
                },
                label: const Text('메뉴 화면으로 GO !'),
                icon: const Icon(
                  Icons.access_alarm,
                  size: 15,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: ElevatedButton.icon(
                onPressed: openDialog,
                label: const Text('로그아웃 !'),
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

  void changeName() {
    user.applyData(name: nameController.text, age: 0, mobile: '01011112222');
  }

  void openDialog() {
    Util.showYesNoDialog(
      title: '로그아웃',
      message: '정말로 로그아웃 하시겠습니까?',
      yesCallback: () {
        Get.back();
        Util.showSnackBar(title: '알림', message: '예 버튼 눌렀음');
      },
      noCallback: () async {
        Util.showProgressDialog(context);

        await Future.delayed(
          const Duration(
            milliseconds: 2000,
          ),
        );
        Get.back();
        Get.back();
        Util.showSnackBar(title: '알림', message: '아니오 버튼 눌렀음');
      },
    );
  }
}
