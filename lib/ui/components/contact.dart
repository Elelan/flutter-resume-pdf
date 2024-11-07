import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kContactBg.withOpacity(0.98),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\nContact',
            style: GoogleFonts.montserrat(
                fontSize: size.height * 0.08,
                fontWeight: FontWeight.w100,
                letterSpacing: 1.0),
          ),
          Text(
            'Let\'s get in touch and build something together ;)\n\n',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ResponsiveWidget(
            desktopScreen: Stack(
              children: [
                // _contactBg(),
                _contactInfoList(size)
              ],
            ),
            mobileScreen: _contactInfoList(size),
          ),
        ],
      ),
    );
  }

  Widget _contactBg() {
    return Container(
      width: double.infinity,
      color: kContactBg,
      child: SvgPicture.asset(
        'assets/images/contact_us_optimized.svg',
        fit: BoxFit.cover,
        semanticsLabel: 'contact_logo',
        matchTextDirection: true,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _contactInfoList(final size) {
    return ResponsiveWidget(
      desktopScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _contactInfo(size, true, kContactAssetPath[0], kContactTitles[0],
                kContactDetails[0]),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            child: _contactInfo(size, true, kContactAssetPath[1], kContactTitles[1],
                kContactDetails[1]),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            child: _contactInfo(size, true, kContactAssetPath[2], kContactTitles[2],
                kContactDetails[2]),
          ),
        ],
      ),
      mobileScreen: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _contactInfo(size, true, kContactAssetPath[0], kContactTitles[0],
              kContactDetails[0]),
          SizedBox(
            width: size.width * 0.02,
          ),
          _contactInfo(size, true, kContactAssetPath[1], kContactTitles[1],
              kContactDetails[1]),
          SizedBox(
            width: size.width * 0.02,
          ),
          _contactInfo(size, true, kContactAssetPath[2], kContactTitles[2],
              kContactDetails[2]),
        ],
      ),
    );
  }

  Widget _contactInfo(
      Size size, bool isMobile, String assetPath, String label, String value) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black12,
        child: SvgPicture.asset(
          '$assetPath',
          width: isMobile ? size.width * 0.4 : size.width * 0.2,
          height: isMobile ? size.width * 0.4 : size.width * 0.2,
        ),
      ),
      title: Text(
        '$label',
        style:
            GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w800),
      ),
      subtitle: Text(
        '$value',
        style:
            GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w800),
      ),
    );
  }
}
