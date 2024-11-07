import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config/constants.dart';
import '../../controllers/menu_controller.dart';
import '../responsive_widget.dart';
import 'social.dart';
import 'web_menu.dart';

class MyAppBar extends StatelessWidget {

  MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //constraints: BoxConstraints(maxWidth: kMaxWidth),
      padding: EdgeInsets.only(
          top: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding,
          left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!Responsive.isMobile(context)) LogoModel(),
          if (Responsive.isDesktop(context)) Spacer(),
          if (!Responsive.isMobile(context)) WebMenu(),
          if (Responsive.isDesktop(context)) Spacer(),
          if (Responsive.isDesktop(context)) Social(),
          if (Responsive.isDesktop(context)) Spacer()
        ],
      ),
    );
  }
}

class AppBarSliver extends StatelessWidget {
  const AppBarSliver({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      stretch: true,
      leadingWidth: 100,
      backgroundColor: Colors.transparent,
      flexibleSpace: WebMenu(),
      leading: LogoModel(),
      actions: [Social()],
    );
  }
}

class LogoModel extends StatelessWidget {
  final AppMenuController _controller = Get.put(AppMenuController());

  LogoModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        _controller.setMenuIndex(0, false);
      },
      child: Container(
          foregroundDecoration: BoxDecoration(
              // color: Colors.white,
              // backgroundBlendMode: BlendMode.saturation,
              ),
          child: Image.asset(
            'assets/images/logo/logo4.png',
            height: size.height * 0.08,
          )),
    );
  }
}
