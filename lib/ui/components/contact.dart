import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

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
          Stack(
            children: [
              Container(
                width: double.infinity,
                color: kContactBg,
                child: SvgPicture.asset(
                  'assets/images/contact_us_optimized.svg',
                  fit: BoxFit.cover,
                  semanticsLabel: 'contact_logo',
                  matchTextDirection: true,
                  alignment: Alignment.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Colombo, SriLanka',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'elelanv@gmail.com',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    '(+94) 77 420 1749',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
