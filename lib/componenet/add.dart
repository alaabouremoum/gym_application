
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/user.dart';
import 'DataController.dart';
import 'home.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  File? _imageFile; 
   final _NameController = TextEditingController();
  final _PhoneController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      // dataController.data.value = _imageFile!.path; 

    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  void _sendImage() {
    if (_imageFile != null) {
      // Get.to(() => Home(imageFile: _imageFile));
     final name = _NameController.text;
    final phoneNumber = _PhoneController.text;
    final user = User(name: name, phoneNumber: phoneNumber, photoPath: _imageFile!.path);
    dataController.addUser(user);
    dataController.data.value = _imageFile!.path; 

    // reset the inputs and the image file
    _NameController.clear();
    _PhoneController.clear();
    _clearImage(); 
    
    }
  }

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ajouter un Nouveau Mombre',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          ),
      
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    controller: _NameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    controller: _PhoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your phone number",
                    ),
                  ),
                ) , 
                const SizedBox(height: 20,),
                    ElevatedButton(
                onPressed: _sendImage,
                child: Text('send'),
              ),
              ],
            ), 


          )
        ],
      ),
    );
  }
}
