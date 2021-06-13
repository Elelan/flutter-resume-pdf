import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/model/contact.dart';

const kPrimaryColor = Color(0xFFFF3B1D);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);
const kAboutBg = Color(0xFFDFE0E5); //#dfe0e5
const kTimelineBg = Color(0xFFDFE0E5); //#dfe0e5
const kContactBg = Color(0xFFDFE0E5); //#dfe0e5
const kCardColor = Color(0xFFFFDEAD); //#FFDEAD

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

final String name = "Elelan";
final String job = "Mobile Developer";
final String description =
    'A mobile full stack developer with experience building mobile and web applications';

final List<ContactModel> contactItems = [
  ContactModel(Icons.home, 'Location', 'Colombo, Srilanka'),
  ContactModel(Icons.phone, 'Phone', '(+94) 77 420 1749'),
  ContactModel(Icons.mail, 'Email', 'elelanv@gmail.com')
];
final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.email
];

final kContactAssetPath = [
  'assets/images/my_location.svg',
  'assets/images/develop_app.svg',
  'assets/images/envelope.svg',
];

final kContactTitles = [
  'Location',
  'Phone',
  'Email'
];

final kContactDetails = [
  'Colombo, Sri Lanka',
  '(+94) 77 420 1749d',
  'elelanv@gmail.com'
];

