import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int get selectedIndex => _selectedIndex.value;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<String> get menuItems =>
      ["About Me", "Experience", "Projects", "Skills", "Blog", "Contact"];

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }
  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}