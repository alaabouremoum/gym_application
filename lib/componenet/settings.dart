import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
           children: [ 
            Center(child: Text('Settings Page'))
           ],
        ),
    );
  }
}