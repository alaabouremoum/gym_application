import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/ThemeServices.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = ThemeService().isSavedDarkMode();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(height: 20),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                const Text('Dark mode'),
                Switch(
          value: isDarkMode,
          onChanged: (value) {
            setState(() {
          isDarkMode = value;
          ThemeService().changeTheme();
            });
          },
        ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}