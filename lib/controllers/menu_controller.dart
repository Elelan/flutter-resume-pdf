import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMenuController extends GetxController {

  bool isDark = false;
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
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
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
    await Scrollable.ensureVisible(_landingGlobalKey.currentState!.context, duration: const Duration(seconds: 2));
  }

  _scrollToAbout() async {
    await Scrollable.ensureVisible(
      _aboutGlobalKey.currentState!.context,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToTimeline() async {
    await Scrollable.ensureVisible(
      _timelineGlobalKey.currentState!.context,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToProjects() async {
    await Scrollable.ensureVisible(
      _projectGlobalKey.currentState!.context,
      duration: const Duration(seconds: 1),
    );
  }

  _scrollToContact() async {
    await Scrollable.ensureVisible(_contactGlobalKey.currentState!.context,
        duration: const Duration(seconds: 1));
  }

  void changeTheme(bool state) {
    if(state) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    isDark = state;
    update();
  }
}
