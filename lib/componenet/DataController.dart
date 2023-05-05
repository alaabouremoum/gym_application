import 'dart:async';

import 'package:get/get.dart';

import '../widgets/user.dart';

class DataController extends GetxController {
  var data = "".obs;
  var users = <User>[].obs;

  void addUser(User user) {
    users.add(user);
  } 
   void deleteUser(User user) {
  users.remove(user); 
   }  
    RxInt remainingTime = 30.obs;

void startTimer(User user) {
  const oneSec = const Duration(seconds: 1);
  Timer.periodic(
    oneSec,
    (Timer timer) {
      if (remainingTime.value == 0) {
        timer.cancel();
      } else {
        remainingTime.value--;
      }
    },
  );
}
}