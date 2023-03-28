
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

  bool isRightDoorLock = true;
  // bool isLeftDoorLock = true;
   void updateRightDoorLock(){
     isRightDoorLock = !isRightDoorLock;
     
     notifyListeners();
    //  if you provider then you may know this
    // it work like setState
   }
  //  void updateLeftDoorLock(){
  //    isLeftDoorLock = !isLeftDoorLock;
     
  //    notifyListeners();
  //   //  if you provider then you may know this
  //   // it work like setState
  //  }
}