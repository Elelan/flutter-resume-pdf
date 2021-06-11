import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config/constants.dart';
import '../../controllers/menu_controller.dart';
import '../responsive_widget.dart';
import 'social.dart';
import 'web_menu.dart';

class MyAppBar extends StatelessWidget {

  final MenuController _controller = Get.put(MenuController());

  MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: kMaxWidth),
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!Responsive.isMobile(context))
            InkWell(
              onTap: (){
                _controller.setMenuIndex(0, false);
              },
              child: Container(
                  foregroundDecoration: BoxDecoration(
                    // color: Colors.white,
                    // backgroundBlendMode: BlendMode.saturation,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/mobile_dev.svg',
                    width: 80,
                    height: 80,
                  )),
            ),
          if (Responsive.isDesktop(context)) WebMenu(),
          Spacer(),
          Social(),
        ],
      ),
    );
  }
}
