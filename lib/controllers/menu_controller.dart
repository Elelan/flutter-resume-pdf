import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey _headerGlobalKey = GlobalKey();
  GlobalKey _landingGlobalKey = GlobalKey();
  GlobalKey _aboutGlobalKey = GlobalKey();
  GlobalKey _experienceGlobalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();
  StreamController _fabStream = StreamController<bool>();

  int get selectedIndex => _selectedIndex.value;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  GlobalKey get landingGlobalKey => _landingGlobalKey;

  GlobalKey get headerGlobalKey => _headerGlobalKey;

  GlobalKey get aboutGlobalKey => _aboutGlobalKey;

  GlobalKey get experienceGlobalKey => _experienceGlobalKey;

  ScrollController get scrollController => _scrollController;

  StreamController get fabStream => _fabStream;

  List<String> get menuItems =>
      ["About Me", "Experience", "Projects", "Skills", "Blog", "Contact"];

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  void setMenuIndex(int index, bool isMobile) {
    _selectedIndex.value = index;
    if (isMobile) {
      openOrCloseDrawer();
    }
    switch (index) {
      case 9:
        _scrollToLanding();
        break;
      case 0:
        _scrollToAbout();
        break;
      case 1:
        _scrollToExperience();
        break;
      case 2:
        break;
      default:
        print('default index is $index');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  void scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToLanding() {
    Scrollable.ensureVisible(_landingGlobalKey.currentContext,
        duration: const Duration(seconds: 2));
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToExperience() {
    Scrollable.ensureVisible(
      _experienceGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }
}
