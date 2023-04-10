import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class User extends StatelessWidget { 
   final String ?name;
  final String ?phoneNumber;
  final String ?photoPath; 
  final   VoidCallback? onDelete; 
  final VoidCallback? payment; 
    final RxInt? remainingTime;
  const User({super.key , this.name ,this.phoneNumber , this.photoPath,this.onDelete, this.payment,this.remainingTime});
   
  @override
  Widget build(BuildContext context) {
    return Container( 
         width: 300, 
         height: 200,  
         decoration: BoxDecoration( 
          color: Colors.grey, 
          borderRadius:BorderRadius.circular(15)
         ),
         child: Padding(
           padding: const EdgeInsets.all(20),
           child: Column(  
              children: [  
              
                Row(  
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [ 
                       Container( 
                          child: Image.file(File(photoPath!)) ,
                           width: 70, 
                           height: 70, 
                           decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(35)
                           ),
                      ), 
                      const SizedBox(width: 25,), 
                      Column(  
                         
                         children: [ 
                          Text(name!),
                          Text(phoneNumber!), 
                         ],
                      )
                  ],
                ), 
                   const SizedBox(height: 30,),
                Row(  
                  
                   children: [  
                    Container(   
                      width: 40, 
                      height: 40,
                      decoration: BoxDecoration( 
                        
         
                      ),
                       child: Text('Counter: ${remainingTime?.value}')),
                    
                    const SizedBox(width: 25,),
                       ElevatedButton(onPressed: payment!, child: Text('payment')),  
                         const SizedBox(width: 25,),
         
                       ElevatedButton(onPressed: onDelete!, child: Text('Delete')),
         
                   ],
                )
              ],
           ),
         ),
    );
  }
} 
