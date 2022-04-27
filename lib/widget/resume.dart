/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resume_pdf/model/content_model.dart';
import 'package:flutter_resume_pdf/model/languages.dart';
import 'package:flutter_resume_pdf/model/online_info.dart';
import 'package:flutter_resume_pdf/model/user_model.dart';
import 'package:flutter_resume_pdf/widget/icon_model.dart';
import 'package:meta/meta.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'content_body.dart';
import 'content_extra.dart';
import 'content_header.dart';
import 'network_images.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
PdfColor lightBlue = PdfColor.fromHex('#66ccff');
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;
const pw.IconData call = pw.IconData(0xe625);

Future<Uint8List> generateResume(PdfPageFormat format) async {
  final doc = pw.Document(title: 'My Resume', author: 'Elelan Vicknesh');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  );

  final user = UserModel(
      firstName: 'Elelan',
      lastName: 'Vickneshvararajah',
      jobTitle: 'Mobile Developer',
      mobile: '94-77-420-1749',
      email: 'elelanv@gmail.com',
      address: 'Colombo, Sri Lanka');

  final work1 = ContentModel(
      title: 'Software Engineer (Android)',
      subTitle: 'Bellvantage',
      startDate: '11/2019',
      endDate: 'Ongoing',
      address: 'Colombo, SriLanka',
      descPoints: [
        "Lankabell Employee Apps development",
        "Developed multiple apps with background/foreground services, Location, Payment Integration"
      ]);

  final project1 = ContentModel(
      title: 'Helper',
      subTitle: '',
      startDate: '',
      endDate: '',
      address: '',
      tags: [
        'Android App',
        'Java',
        'Firebase'
      ],
      descPoints: [
        'Customer and employee login, registration',
        'Assigning jobs, accessing firebase real-time database'
      ]);

  final project2 = ContentModel(
      title: 'VR Cycling',
      subTitle: '',
      startDate: '',
      endDate: '',
      address: '',
      tags: [
        '(Android VR app)',
        'Unity',
        'Firebase',
        'C#',
        'Android Studio'
      ],
      descPoints: [
        'Virtual reality video viewing experience using mobile devices',
        'Provides extra analytical data'
      ]);

  final project3 = ContentModel(
      title: 'www.SpicesExpert.com',
      subTitle: 'Personal project',
      startDate: '',
      endDate: '',
      address: '',
      tags: [
        'React',
        'Express js',
        'Node js',
        'AWS',
        'Firebase'
      ],
      descPoints: [
        'Created and hosted MERN e-commerce project',
        'Built restful apis and nodejs backend with mongodb'
      ]);

  final edu1 = ContentModel(
      title: 'Bachelor of Science',
      subTitle: 'Wayamba University of Sri Lanka',
      startDate: '2016',
      endDate: '2019',
      address: 'Kuliyapitiya, Sri Lanka',
      descPoints: [
        'Computing & Info System, Industrial Management, Statistics'
      ]);

  final edu2 = ContentModel(
      title: 'Advanced Level',
      subTitle: "St John's College",
      startDate: '2000',
      endDate: '2013',
      address: 'Jaffna, Sri Lanka',
      descPoints: ['Combined Mathematics, Physics, ICT']);

  final tags = [
    'Java',
    'Android',
    'Git',
    'Android Studio',
    'Flutter',
    'Dart',
    'Kotlin',
    'NodeJs',
    'JavaScript',
    'Firebase',
    'RESTful APIs',
  ];

  final languages = [
    Language('English', 'Proficient', 5),
    Language('Tamil', 'Native', 5),
    Language('Sinhala', 'Intermediate', 3),
  ];

  final gitlab_url =
      'https://about.gitlab.com/images/press/logo/png/gitlab-icon-rgb.png';
  final linkedn_url =
      'https://img.icons8.com/cute-clipart/64/000000/linkedin.png';
  final twitter_url =
      'https://img.icons8.com/cute-clipart/64/000000/twitter.png';
  // final gitLabImg = await networkImage('');
  final gitLabImg = await imageFromAssetBundle('assets/images/gitlab_icon.png');
  final linkedInImg =
      await imageFromAssetBundle('assets/images/linkedin_icon.png');
  final twitterImg =
      await imageFromAssetBundle('assets/images/twitter_icon.png');
  //

  final online = [
    OnlineInfo(
        '/vickneshelelan', 'https://gitlab.com/vickneshelelan', gitLabImg),
    OnlineInfo('/elelan', 'https://www.linkedin.com/in/elelan/', linkedInImg),
    OnlineInfo('@vickneshelelan', '', twitterImg)
  ];

  // final coding = await networkImage("https://img.icons8.com/pastel-glyph/64/000000/laptop-coding--v1.png");
  final coding = pw.MemoryImage(
      (await rootBundle.load('assets/coding.png')).buffer.asUint8List());
  // final gaming = await networkImage('https://img.icons8.com/material-outlined/24/000000/like--v1.png');
  final gaming = pw.MemoryImage(
      (await rootBundle.load('assets/like.png')).buffer.asUint8List());
  final passions = [
    OnlineInfo('Programming', '', coding),
    OnlineInfo('Gaming', '', gaming),
  ];

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
        maxPages: 1,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisAlignment: pw.MainAxisAlignment.start,
        pageTheme: pageTheme,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
                alignment: pw.Alignment.topLeft,
                child: pw.Partitions(children: [
                  pw.Partition(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: <pw.Widget>[
                        pw.Text(user.firstName.toUpperCase(),
                            style: pw.TextStyle(
                                fontSize: 26, font: pw.Font.courierBold())),
                        pw.Text(user.lastName.toUpperCase(),
                            style: pw.TextStyle(
                                fontSize: 26, font: pw.Font.courierBold())),
                        pw.Text(user.jobTitle,
                            style: pw.TextStyle(
                                color: PdfColors.blue,
                                fontSize: 13.29,
                                fontBold: pw.Font.timesBold())),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Container(
                                  child: pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: <pw.Widget>[
                                    //Call Icon
                                    pw.Container(
                                        child:
                                            IconMdl(0xe551, 12, PdfColors.blue)
                                        //child: pw.Icon( pw.IconData(0xe551), size: 12, color: PdfColors.blue) //f073 //e109
                                        ),
                                    pw.SizedBox(width: 3),
                                    //Mobile Number
                                    pw.Text(user.mobile,
                                        style: pw.TextStyle(fontSize: 8))
                                  ])),
                              pw.Container(
                                  child: pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.end,
                                      children: <pw.Widget>[
                                    //@Sign
                                    pw.Container(
                                        child: IconMdl(
                                            0xe0be, 12, PdfColors.blue)),

                                    pw.SizedBox(width: 3),
                                    //email
                                    pw.Text(user.email,
                                        style: pw.TextStyle(fontSize: 8))
                                  ]))
                            ]),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Container(
                                  child: pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: <pw.Widget>[
                                    //Location Icon Icon
                                    pw.Container(
                                        child: IconMdl(
                                            0xe88a, 12, PdfColors.blue)),
                                    pw.SizedBox(width: 3),
                                    //Address
                                    pw.Text(user.address,
                                        style: pw.TextStyle(fontSize: 8))
                                  ])),
                            ])
                      ])),
                  pw.Partition(
                    width: sep,
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: <pw.Widget>[
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 30),
                            width: 100,
                            height: 100,
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(8),
                              //border: pw.Border.all(width: 0.5)
                            ),
                            child: pw.ClipRRect(
                                horizontalRadius: 8,
                                verticalRadius: 8,
                                child: pw.Image(
                                  profileImage,
                                  width: 100,
                                  height: 100,
                                  fit: pw.BoxFit.cover,
                                )),
                          )
                        ]),
                  ),
                ])),
            pw.Container(
                padding: pw.EdgeInsets.only(top: 10),
                child: pw.Row(
                    //mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Expanded(
                          flex: 3,
                          child: pw.Container(
                              padding: pw.EdgeInsets.zero,
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  mainAxisSize: pw.MainAxisSize.min,
                                  children: <pw.Widget>[
                                    ContentHeader(title: 'Experience'),
                                    ContentBody(work1),
                                    ContentHeader(title: 'Projects'),
                                    ContentBody(project3),
                                    ContentBody(project1),
                                    ContentBody(project2),
                                    ContentHeader(title: 'Education'),
                                    ContentBody(edu1),
                                    ContentBody(edu2),
                                  ]))),
                      pw.SizedBox(width: 10),
                      pw.Expanded(
                          flex: 2,
                          child: pw.Container(
                              alignment: pw.Alignment.topLeft,
                              child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  mainAxisSize: pw.MainAxisSize.min,
                                  children: <pw.Widget>[
                                    ContentHeader(title: 'Skills'),
                                    ContentExtra(tagList: tags),
                                    ContentHeader(title: 'Languages'),
                                    ContentExtra(languageList: languages),
                                    ContentHeader(title: 'Find me online'),
                                    ContentExtra(onlineList: online),
                                    ContentHeader(title: 'Passions'),
                                    ContentExtra(onlineList: passions)
                                  ])))
                    ])),
          ];
        },
        footer: _buildFooter),
  );
  return doc.save();
}

pw.Widget _buildFooter(pw.Context context) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    crossAxisAlignment: pw.CrossAxisAlignment.end,
    children: [
      pw.Text(
        'Page ${context.pageNumber}/${context.pagesCount}',
        style: const pw.TextStyle(
          fontSize: 9,
          color: PdfColors.black,
        ),
      ),
      pw.Link(
          destination: "https://github.com/DavBfr/dart_pdf",
          child: pw.Text('This resume is generated using flutter pdf',
              style: const pw.TextStyle(fontSize: 8, color: PdfColors.black))),
    ],
  );
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle.loadString('assets/invoice.svg');
  final bgShape = await imageFromAssetBundle('assets/cv_bg.png');
  final bgImg = await imageFromAssetBundle('assets/images/bg.jpeg');
  format = format.applyMargin(
      left: 0.5 * PdfPageFormat.cm,
      top: 0.5 * PdfPageFormat.cm,
      right: 0.5 * PdfPageFormat.cm,
      bottom: 1.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load('assets/open-sans.ttf')),
      bold: pw.Font.ttf(await rootBundle.load('assets/open-sans-bold.ttf')),
      //icons: pw.Font.ttf(await rootBundle.load('assets/material.ttf')),
      icons: pw.Font.ttf(
          await rootBundle.load('assets/fonts/MaterialIcons-Regular.ttf')),
      //icons: pw.Font.ttf(await rootBundle.load('assets/fonts/materialicons-regular.ttf')),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
          ignoreMargins: true,
          child: pw.Container(
              decoration: pw.BoxDecoration(
                  image:
                      pw.DecorationImage(image: bgShape, fit: pw.BoxFit.cover)))
          // child: pw.Stack(
          //   children: [
          //     pw.Positioned(
          //       child: pw.SvgImage(svg: bgShape),
          //       left: 0,
          //       top: 0,
          //     ),
          //     pw.Positioned(
          //       child: pw.Transform.rotate(
          //           angle: pi, child: pw.SvgImage(svg: bgShape)),
          //       right: 0,
          //       bottom: 0,
          //     ),
          //   ],
          // ),
          //child: pw.Container(child: pw.Image(bgImg, fit: pw.BoxFit.cover))
          );
      //child: pw.Container(color: PdfColors.grey500));
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({this.title, this.icon});

  final String title;

  final pw.IconData icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 2.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                      color: green, shape: pw.BoxShape.circle),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        decoration: const pw.BoxDecoration(
          color: lightGreen,
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
        ),
        margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
        padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
        child: pw.Text(title, textScaleFactor: 1.5));
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    @required this.size,
    @required this.value,
    this.title,
    this.fontSize = 1.2,
    this.color = green,
    this.backgroundColor = PdfColors.grey300,
    this.strokeWidth = 5,
  }) : assert(size != null);

  final double size;

  final double value;

  final pw.Widget title;

  final double fontSize;

  final PdfColor color;

  final PdfColor backgroundColor;

  final double strokeWidth;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    if (title != null) {
      widgets.add(title);
    }

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
