import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavbar.dart';

import 'package:flutter_application_1/componenet/home.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart'; 
import 'loadingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp (  
        
      debugShowCheckedModeBanner: false,
        home: LoadingPage(),
    );
  }
}

