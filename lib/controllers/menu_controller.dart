import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey _landingGlobalKey = GlobalKey();
  GlobalKey _aboutGlobalKey = GlobalKey();
  GlobalKey _timelineGlobalKey = GlobalKey();
  GlobalKey _projectGlobalKey = GlobalKey();
  GlobalKey _contactGlobalKey = GlobalKey();

  ScrollController _scrollController = ScrollController();
  StreamController _fabStream = StreamController<bool>();

  int get selectedIndex => _selectedIndex.value;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  GlobalKey get landingGlobalKey => _landingGlobalKey;

  GlobalKey get aboutGlobalKey => _aboutGlobalKey;

  GlobalKey get timelineGlobalKey => _timelineGlobalKey;

  GlobalKey get projectGlobalKey => _projectGlobalKey;

  GlobalKey get contactGlobalKey => _contactGlobalKey;

  ScrollController get scrollController => _scrollController;

  StreamController get fabStream => _fabStream;

  List<String> get menuItems =>
      ["Home", "About Me", "Experience", "Projects", "Contact"];

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
      case 0: //landing page
        scrollToLanding();
        break;
      case 1: //About me
        _scrollToAbout();
        break;
      case 2: //Timeline(experience)
        _scrollToTimeline();
        break;
      case 3: //Projects
        _scrollToProjects();
        break;
      case 4: //Contact
        _scrollToContact();
        break;
      default:
        print('default index is $index');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  scrollToLanding() async {
    await Scrollable.ensureVisible(_landingGlobalKey.currentContext,
        duration: const Duration(seconds: 2));
  }

  _scrollToAbout() async {
    await Scrollable.ensureVisible(
      _aboutGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToTimeline() async {
    await Scrollable.ensureVisible(
      _timelineGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToProjects() async {
    await Scrollable.ensureVisible(
      _projectGlobalKey.currentContext,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToContact() async {
    await Scrollable.ensureVisible(_contactGlobalKey.currentContext,
        duration: const Duration(seconds: 1));
  }
}
