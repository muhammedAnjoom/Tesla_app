
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
    bool isTopDoorLock = true;
      bool isBottomDoorLock = true;
   void updateRightDoorLock(){
     isRightDoorLock = !isRightDoorLock;
     
     notifyListeners();
    //  if you provider then you may know this
    // it work like setState
   }
   void updateLeftDoorLock(){
     isLeftDoorLock = !isLeftDoorLock;
     notifyListeners();
   }
   void updateTopDoorLock(){
     isTopDoorLock = !isTopDoorLock;
     notifyListeners();
   }
    void updateBottomDoorLock(){
     isBottomDoorLock = !isBottomDoorLock;
     notifyListeners();
   }
}