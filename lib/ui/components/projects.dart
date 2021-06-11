import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';

class Projects extends StatelessWidget {
  const Projects({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kDarkBlackColor,
      height: size.height*0.9,
      child: Text("Projecyts"),
    );
  }
}
