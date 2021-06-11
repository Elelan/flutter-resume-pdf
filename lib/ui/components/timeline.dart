import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:flutter_resume_pdf/widget/custom_text.dart';
import 'package:flutter_resume_pdf/widget/work_custom_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Timeline extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: size.width, height: size.height),
      child: Container(
        color: kTimelineBg,
        child: Column(
          children: [

            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height*0.7,
                      child: Stack(
                        children: [
                          Center(
                            child: VerticalDivider(
                              color: kYellow,
                              thickness: 1.75,
                              width: 10,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          Container(
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor: Colors.pink,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.laptopHouse,
                                        color: Colors.white),
                                  ),
                                ),
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.freeCodeCamp,
                                        color: Colors.white),
                                  ),
                                ),
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor: Colors.brown,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.laptopCode,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: size.height * 0.7,
                      child: WorkBox(),
                    )),
                Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      'assets/images/working_master.svg',
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Software Engineer in Bellvantage",
          subTitle:
              "I am currently working at Bellvantage as a Software Engineer developing mobile apps in both flutter and native java",
          duration: "2020 - Present",
        ),
        WorkCustomData(
          title: "Trainee Software Engineer, Bellvantage",
          subTitle:
              "started at Bellvantage as a Trainee Software Engineer",
          duration: "Nov - 2019 to May - 2020",
        ),
        WorkCustomData(
          title:
              "BSc Applied Sciences, Wayamba University of Sri Lanka",
          subTitle:
              "...",
          duration: "Jan - 2016 to Apr - 2019",
        ),
      ],
    );
  }
}
