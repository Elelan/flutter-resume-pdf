import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: kContactBg,
          child: SvgPicture.asset(
            'assets/images/contact_us.svg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Container(
          //color: kContactBg.withOpacity(0.4),
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
              SizedBox(
                height: size.height * 0.02,
              ),
              // SvgPicture.asset(
              //   'assets/images/contact_us.svg',
              //   alignment: Alignment.center,
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Colombo, SriLanka',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: kBgColor,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'elelanv@gmail.com',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: kBgColor,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    '(+94) 77 420 1749',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: kBgColor,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
