import 'dart:async';

import 'package:get/get.dart';

import '../widgets/user.dart';

// // class DataController extends GetxController {
// //   var data = ''.obs;
// // } 
// class DataController extends GetxController {
//   RxString data = RxString('');

//   @override
//   void onInit() {
//     super.onInit();
//     data.listen((value) {
//       update(); // trigger a redraw when data changes
//     });
//   }
// } 

class DataController extends GetxController {
  var data = "".obs;
  var users = <User>[].obs;

  void addUser(User user) {
    users.add(user);
  } 
   void deleteUser(User user) {
  users.remove(user); 
   }  
   var remainingTime = 30.obs;
    void startTimer(User user) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if ((user.remainingTime?.value ?? 0) <= 0) {
        timer.cancel();
      } else {
       user.remainingTime?.value -= 1;
      }
    });
  }
}