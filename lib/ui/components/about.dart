import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/model/skill.dart';

import '../responsive_widget.dart';

class About extends StatelessWidget {
  final _avatar = 'assets/profile.jpg';
  final _desc =
      'A Passionate Full Stack Mobile Developer having an experience of building Mobile applications\nHave worked with Native Android, Flutter and NodeJs Applications';

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: kBgColor,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15, vertical: 100),
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    foregroundDecoration: BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.saturation,
                    ),
                    color: Colors.grey[100],
                    child: Image.asset(
                      '$_avatar',
                      fit: BoxFit.fitWidth,
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      Text(
                        _desc,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.black.withOpacity(.7),
                            fontSize: 17,
                            fontFamily: 'Raleway'),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Hire Me Now',
                              style: TextStyle(color: kGreyLight),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered)) {
                                    return kPrimaryColor.withOpacity(0.5);
                                  } else {
                                    return kPrimaryColor;
                                  }
                                })),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            child: const Text('View Resume',
                                style: TextStyle(color: kGreyLight)),
                            onPressed: () {},
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered)) {
                                    return kBlack.withOpacity(0.5);
                                  } else {
                                    return kBlack;
                                  }
                                })),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 100),
            Text('MY SKILLS', style: AppStyles.title),
            Container(width: 120, height: 2, color: kPrimaryColor),
            const SizedBox(height: 3),
            Container(width: 100, height: 2, color: kBlack),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              runAlignment: WrapAlignment.spaceBetween,
              children: SKILLS.map(_buildSkill).toList(),
            ),
          ],
        ),
      ),
      mobileScreen: Container(
          color: kBgColor,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15,
              vertical: 100),
          child: Column(
            children: [
              Card(
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  foregroundDecoration: BoxDecoration(
                    color: Colors.grey,
                    backgroundBlendMode: BlendMode.saturation,
                  ),
                  color: Colors.grey[100],
                  child: Image.asset(
                    '$_avatar',
                    fit: BoxFit.fitWidth,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'About Me',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
              Text(
                _desc,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.black.withOpacity(.7),
                    fontSize: 17,
                    fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Hire Me Now',
                  style: TextStyle(color: kGreyLight,),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<
                        EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20)),
                    backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed) ||
                              states.contains(MaterialState.hovered)) {
                            return kPrimaryColor.withOpacity(0.5);
                          } else {
                            return kPrimaryColor;
                          }
                        })),
              ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text('View Resume',
                    style: TextStyle(color: kGreyLight)),
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<
                        EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20)),
                    backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed) ||
                              states.contains(MaterialState.hovered)) {
                            return kBlack.withOpacity(0.5);
                          } else {
                            return kBlack;
                          }
                        })),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 100, height: 2, color: kPrimaryColor),
              const SizedBox(height: 3),
              Container(width: 80, height: 2, color: kBlack),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              )
            ],
          )),
    );
  }

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name),);
}
