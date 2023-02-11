import 'package:get/get.dart';

class User extends GetxController {
  Rx<String> name;
  late Rx<int> age;
  late Rx<String> mobile;

  User({
    required this.name,
    required this.age,
    required this.mobile,
  });

  void setData({name, age, mobile}) {
    this.name.value = name;
    this.age.value = age;
    this.mobile.value = mobile;
  }

  void applyData({name, age, mobile}) {
    setData(
      name: name,
      age: age,
      mobile: mobile,
    );
    update();
  }
}
