import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/ui/responsive_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardWidget extends StatefulWidget {
  final String? cardIcon;
  final IconData? cardIconData;
  final String cardTitle;
  final String cardDesc;
  final String? cardLink;
  final double? cardWidth;
  final double? cardHeight;
  final String? backImage;
  final Widget? bottomWidget;

  const InfoCardWidget(
      {Key? key,
      this.cardIcon,
      this.cardIconData,
      required this.cardTitle,
      required this.cardDesc,
      this.cardLink,
      this.cardWidth,
      this.cardHeight,
      this.backImage,
      this.bottomWidget})
      : super(key: key);

  @override
  _InfoCardWidgetState createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        print('ontapped');
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isHover
                ? [
                    BoxShadow(
                        color: kPrimaryColor.withAlpha(200),
                        blurRadius: 12,
                        offset: Offset(2.0, 3.0))
                  ]
                : []),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.cardIcon != null
                    ? Image.asset(
                        widget.cardIcon!,
                        height: size.height * 0.1,
                      )
                    : Container(),
                widget.cardIconData != null
                    ? Icon(
                        widget.cardIconData,
                        color: kPrimaryColor,
                        size: size.height * 0.1,
                      )
                    : Container(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  widget.cardTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: size.height * 0.02,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  widget.cardDesc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: size.height * 0.015,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w100,
                      height: Responsive.isDesktop(context) ? 2.0 : 1.5),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                widget.bottomWidget ?? Container()
              ],
            ),
            AnimatedOpacity(
              opacity: isHover ? 0.0 : 1.0,
              duration: Duration(microseconds: 400),
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.backImage != null
                    ? Image.asset(widget.backImage!)
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
