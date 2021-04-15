import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:flutter_resume_pdf/ui/components/social.dart';
import 'package:flutter_resume_pdf/ui/components/web_menu.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../responsive_widget.dart';

class Header extends StatelessWidget {
  final String _name = "Elelan";
  final String _job = "Mobile Developer";
  final String _description =
      'A mobile full stack developer with experience building mobile and web applications';

  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
    desktopScreen: Container(
      width: double.infinity,
      color: kDarkBlackColor,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .15,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!Responsive.isMobile(context))
                        Container(
                            foregroundDecoration: BoxDecoration(
                              color: Colors.grey,
                              backgroundBlendMode: BlendMode.saturation,
                            ),
                            child: SvgPicture.asset('assets/icons/mobile_dev.svg', width: 80, height: 80,)),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      Social(),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Text(
                    "I am $_name",
                    style: TextStyle(
                      fontSize: 40,
                      color: kBgColor,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      '$_job',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Raleway',
                        fontSize: 40,
                        height: 1.1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        _description,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.grey[100],
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5,
                        vertical: kDefaultPadding /
                            (Responsive.isDesktop(context) ? 1 : 2),
                      ),
                    ),
                    child: Text('Download Resume'),
                  ),
                  if (Responsive.isDesktop(context))
                    SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    mobileScreen: Container(
      width: double.infinity,
      color: kDarkBlackColor,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .15,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _controller.openOrCloseDrawer();
                        },
                      ),
                      Spacer(),
                      Social()
                    ],
                  ),
                  SizedBox(height: 16,),
                  FittedBox(
                    fit: BoxFit.none,
                    clipBehavior: Clip.none,
                    child: Text(
                      'I’m $_name',
                      style: TextStyle(
                        color: kBgColor,
                        fontSize: 30,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  FittedBox(
                    child: Text(
                      '$_job',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Raleway',
                        fontSize: 30,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

}
