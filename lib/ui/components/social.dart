import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../responsive_widget.dart';

class Social extends StatelessWidget {
  const Social({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          InkWell(
            child: IconButton(
              hoverColor: kPrimaryColor,
                onPressed: () {},
                icon: Icon(
                  FontAwesome.facebook,
                  color: Colors.white,
                )),
          ),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.linkedin,
                color: Colors.white,
              ),
              onPressed: () {}),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.instagram,
                color: Colors.white,
              ),
              onPressed: () {}),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.gitlab,
                color: Colors.white,
              ),
              onPressed: () {}),
        SizedBox(width: kDefaultPadding),
      ],
    );
  }
}