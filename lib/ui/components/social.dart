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
                hoverColor: kDarkBlackColor,
                onPressed: () {},
                icon: Icon(
                  FontAwesome.facebook,
                  color: kPrimaryColor,
                )),
          ),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.linkedin,
                color: kPrimaryColor,
              ),
              onPressed: () {}),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.instagram,
                color: kPrimaryColor,
              ),
              onPressed: () {}),
        if (!Responsive.isMobile(context))
          IconButton(
              icon: Icon(
                FontAwesome.gitlab,
                color: kPrimaryColor,
              ),
              onPressed: () {}),
        SizedBox(width: kDefaultPadding),
      ],
    );
  }
}
