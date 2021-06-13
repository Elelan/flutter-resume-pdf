import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../responsive_widget.dart';

class Social extends StatelessWidget {
  const Social({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialMenuItem(iconData: FontAwesomeIcons.facebook, press: () {}),
        SocialMenuItem(iconData: FontAwesomeIcons.linkedin, press: () {}),
        SocialMenuItem(iconData: FontAwesomeIcons.instagram, press: () {}),
        SocialMenuItem(iconData: FontAwesomeIcons.gitlab, press: () {}),
        SocialMenuItem(iconData: FontAwesomeIcons.github, press: () {}),
        SocialMenuItem(iconData: FontAwesomeIcons.google, press: () {})
      ],
    );
  }
}

class SocialMenuItem extends StatefulWidget {
  const SocialMenuItem({
    Key key,
    this.press,
    @required this.iconData,
    this.iconColor,
    this.hoverColor,
  }) : super(key: key);

  final VoidCallback press;
  final IconData iconData;
  final Color iconColor;
  final Color hoverColor;

  @override
  _SocialMenuItemState createState() => _SocialMenuItemState();
}

class _SocialMenuItemState extends State<SocialMenuItem> {
  bool _isHover = false;
  Color _iconColor = Colors.black26;
  Color _hoverColor = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: Icon(
          widget.iconData,
          color: _isHover
              ? (widget.hoverColor != null ? widget.hoverColor : _hoverColor)
              : (widget.iconColor != null ? widget.iconColor : _iconColor),
        ),
      ),
    );
  }
}
