import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkCustomData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String duration;

  const WorkCustomData(
      {Key? key,
        required this.title,
        required this.subTitle,
        required this.duration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          duration,
          style: GoogleFonts.montserrat(
            fontSize: 13.0,
            color: kDarkBlackColor.withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 22.0,
            color: kDarkBlackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 13.0,
            color: kDarkBlackColor.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),

      ],
    );
  }
}
