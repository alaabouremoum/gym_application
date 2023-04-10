

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'componenet/home.dart'; 
import 'componenet/add.dart';
import 'componenet/settings.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {   int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
     Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return  MaterialPageRoute(
          settings: settings,
          builder: (context) => Home(),
        );
      },
    ), 
     Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Add(),
        );
      },
    ),
    Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Settings(),
        );
      },
    ), 
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(  
       body: IndexedStack(
         index: _selectedIndex, 
         children: _widgetOptions,
       ),
       bottomNavigationBar:  Container( 
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(  
            backgroundColor: Colors.black, 
            color:Colors.white, 
            activeColor: Colors.white, 
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,   
           selectedIndex: _selectedIndex, 
           onTabChange: _onItemTapped,
            padding: EdgeInsets.all(16),
            tabs: const [ 
              GButton(icon: Icons.home , 
              text: 'home',
              ) ,
             
               GButton(icon: Icons.add_circle_outline, 
               text: 'Add',) ,
                GButton(icon: Icons.settings,
                text: 'setting',) ,
                
              
        
            ],
          ),
        ),
      ),
    );
  }
} 

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//   Add _addScreen = Add(); // create an instance of the Add screen

//   static List<Widget> _widgetOptions = <Widget>[
//     const Home(),
//     Add(),
//     const Settings(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }  
 
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       _addScreen.setImageFile(File(pickedFile.path)); // call the setImageFile method
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _widgetOptions,
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
//           child: GNav(
//             backgroundColor: Colors.black,
//             color: Colors.white,
//             activeColor: Colors.white,
//             tabBackgroundColor: Colors.grey.shade800,
//             gap: 8,
//             selectedIndex: _selectedIndex,
//             onTabChange: _onItemTapped,
//             padding: const EdgeInsets.all(16),
//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: 'home',
//               ),
//               GButton(
//                 icon: Icons.add_circle_outline,
//                 text: 'hSearch',
//               ),
//               GButton(
//                 icon: Icons.settings,
//                 text: 'setting',
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _pickImage(ImageSource.camera),
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }