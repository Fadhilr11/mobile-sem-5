import 'package:get/get.dart';

class User {
  String name;
  int age;
  String job;
  int hours;
  int minutes;

  User({required this.name, required this.age, required this.job, required this.hours, required this.minutes});
  RxString imagePath = RxString('');
}
