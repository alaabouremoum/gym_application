

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/sideBar.dart';
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
    setState(() {
      _filteredUsers.remove(user);
    });
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
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
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
      ),
      drawer: const SideBar(),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (dataController.users.isEmpty) {
            return Center(
              child: Text("No users found."),
            );
          } else {
            List<User> usersToDisplay = _filteredUsers.isNotEmpty
                ? _filteredUsers
                : dataController.users;
            return ListView.builder(
              itemCount: usersToDisplay.length,
              itemBuilder: (BuildContext context, int index) {
                final user = usersToDisplay[index]; 
             
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: User(
                    name: user.name,
                    phoneNumber: user.phoneNumber,
                    photoPath: user.photoPath,
                    onDelete: () => _deleteUser(user),
                    // payment: () => _paymentUser(user),
                    // remainingTime: dataController.remainingTime,
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
