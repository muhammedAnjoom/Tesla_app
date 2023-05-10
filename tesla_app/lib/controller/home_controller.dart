import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
 
  int selectedBottomTab = 0;
  void onBottomNavigationTabChanges(int index) {
    selectedBottomTab= index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isTopDoorLock = true;
  bool isBottomDoorLock = true;
  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;

    notifyListeners();
    //  if you provider then you may know this
    // it work like setState
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateTopDoorLock() {
    isTopDoorLock = !isTopDoorLock;
    notifyListeners();
  }

  void updateBottomDoorLock() {
    isBottomDoorLock = !isBottomDoorLock;
    notifyListeners();
  }
  bool isCoolSelected = true;
   void updateCoolSelectTap() {
     isCoolSelected = !isCoolSelected;
     notifyListeners();
   }
}
