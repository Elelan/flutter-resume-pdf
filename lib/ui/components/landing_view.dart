import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/widget/shadow_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants.dart';
import '../../controllers/menu_controller.dart';
import '../responsive_widget.dart';

class LandingPage extends StatelessWidget {
  final String _name = "Elelan V";
  final String _job = "I build things for the Android and web";
  final String _description =
      'I am a freelancer from SriLanka\nwith experience building mobile and web applications';

  final AppMenuController _controller = Get.put(AppMenuController());

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _controller.landingGlobalKey,
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      color: kDarkBlackColor.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: kDefaultPadding * 2),
          Text('Hi, I am'),
          ShadowText(
            '$_name',
            style: TextStyle(
              fontSize: 50,
              color: kPrimaryColor,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
          AnimatedTextKit(
            pause: Duration(seconds: 1),
            animatedTexts: [
              _animatedText('Android Developer'),
              _animatedText('Flutter Developer'),
              _animatedText('Technology enthusist'),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          //   child: ShadowText(
          //     '$_job',
          //     style: TextStyle(
          //       color: kBgColor,
          //       fontFamily: 'Raleway',
          //       fontSize: 40,
          //       height: 1.1,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: SizedBox(
              child: Text(
                _description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[100],
                      fontSize: 17,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              _controller.setMenuIndex(4, false);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical:
                    kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
              ),
            ),
            child: const Text('Get in Touch'),
          ),
          if (Responsive.isDesktop(context)) SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  TypewriterAnimatedText _animatedText(String text) {
    return TypewriterAnimatedText(
        '$text',
        textStyle: GoogleFonts.montserrat(fontSize: 35),
      speed: const Duration(milliseconds: 200)
    );
  }
}
