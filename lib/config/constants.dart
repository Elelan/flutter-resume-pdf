import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF3B1D);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);
const kAboutBg = Color(0xFFDFE0E5); //#dfe0e5

const kDefaultPadding = 25.0;
const kMaxWidth = 1232.0;
const kDefaultDuration = Duration(milliseconds: 250);

const kYellow = Color(0xFFF9A825);
const kBlack = Color(0xDD000000);
const kGreyLight = Color(0xFFF5F5F5);

mixin AppStyles {
  static final TextStyle title = TextStyle(
    color: kBlack.withOpacity(.8),
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );
}
