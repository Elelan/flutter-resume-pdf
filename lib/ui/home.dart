import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:get/get.dart';

import 'components/header.dart';
import 'components/side_menu.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final MenuController _controller = Get.put(MenuController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _controller.scaffoldKey,
        drawer: SideMenu(),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  constraints: BoxConstraints(maxWidth: kMaxWidth),
                  child: SafeArea(child: LandingView()),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

