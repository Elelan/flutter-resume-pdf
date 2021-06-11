import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:flutter_resume_pdf/widget/info_card.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kContactBg.withOpacity(0.9),
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoCardWidget(
                cardTitle: kContactTitles[0],
                cardDesc: kContactDetails[0],
                cardIconData: kContactIcons[0],
                cardWidth: Responsive.isDesktop(context)
                    ? size.width * 0.25
                    : size.width * 0.2,
                cardHeight: Responsive.isDesktop(context)
                    ? size.height * 0.25
                    : size.height * 0.28,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              InfoCardWidget(
                cardTitle: kContactTitles[1],
                cardDesc: kContactDetails[1],
                cardIconData: kContactIcons[1],
                cardWidth: Responsive.isDesktop(context)
                    ? size.width * 0.25
                    : size.width * 0.2,
                cardHeight: Responsive.isDesktop(context)
                    ? size.height * 0.25
                    : size.height * 0.28,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              InfoCardWidget(
                cardTitle: kContactTitles[2],
                cardDesc: kContactDetails[2],
                cardIconData: kContactIcons[2],
                cardWidth: Responsive.isDesktop(context)
                    ? size.width * 0.25
                    : size.width * 0.2,
                cardHeight: Responsive.isDesktop(context)
                    ? size.height * 0.25
                    : size.height * 0.28,
              )
            ],
          )
        ],
      ),
    );
  }
}
