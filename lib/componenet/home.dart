
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/user.dart';
import 'package:get/get.dart';
import 'DataController.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 final DataController dataController = Get.put(DataController());   

 List<User> _filteredUsers = [];

void _deleteUser(User user) {
 
    dataController.deleteUser(user);
  
} 

  void _paymentUser(User user) {
    dataController.startTimer(user);
  }
void searchUser(String query) {
    List<User> users = dataController.users;
    if (query.isNotEmpty) {
      List<User> filteredUsers = [];
      users.forEach((user) {
        if (user.name!.toLowerCase().contains(query.toLowerCase()) ||
            user.phoneNumber!.contains(query)) {
          filteredUsers.add(user);
        }
      });
      setState(() {
        _filteredUsers = filteredUsers;
      });
    } else {
      setState(() {
        _filteredUsers = users;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextField(
          onChanged: (query) => searchUser(query),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (_filteredUsers.isEmpty) {
            return Center(
              child: Text("No users found."),
            );
          } else {
            return ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                final user = _filteredUsers[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: User(
                    name: user.name,
                    phoneNumber: user.phoneNumber,
                    photoPath: user.photoPath,
                    onDelete: () => _deleteUser(user),
                    payment: () => _paymentUser(user),
                    remainingTime: dataController.remainingTime,
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}