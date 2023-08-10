import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  void onButtonNavigationTabChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  bool isLeftDoorLock = true;
  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  bool isFrunkDoorLock = true;
  void updateFrunkDoorLock() {
    isFrunkDoorLock = !isFrunkDoorLock;
    notifyListeners();
  }

  bool isTrunkDoorLock = true;
  void updateTrunkDoorLock() {
    isTrunkDoorLock = !isTrunkDoorLock;
    notifyListeners();
  }

  bool isCoolSelected = true;
  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  bool isShowTyres = false;
  void showTyreController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          isShowTyres = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyres = false;
      notifyListeners();
    }
  }

  bool isShowTyreStatus = false;

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}
