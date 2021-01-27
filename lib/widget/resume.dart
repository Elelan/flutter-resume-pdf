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
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'content_body.dart';
import 'content_header.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
PdfColor lightBlue = PdfColor.fromHex('#66ccff');
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;
const pw.IconData call = pw.IconData(0xe625);

Future<Uint8List> generateResume(PdfPageFormat format) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
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
                      pw.Text("Elelan".toUpperCase(),
                          style: pw.TextStyle(fontSize: 26, font: pw.Font.courierBold())),
                      pw.Text("Vickneshvararajah".toUpperCase(),
                          style: pw.TextStyle(fontSize: 26, font: pw.Font.courierBold())),
                      pw.Text('Mobile Developer',
                          style: pw.TextStyle(fontSize: 13.29, color: PdfColor.fromHex("#b4ddff"))),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Container(
                                child: pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: <pw.Widget>[
                                  //Call Icon
                                  pw.Container(
                                    height: 20,
                                    width: 20,
                                    child: pw.Text('a'),
                                  ),
                                  //Mobile Number
                                  pw.Text('0774201749')
                                ])),
                            pw.Container(
                                child: pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.end,
                                    children: <pw.Widget>[
                                  //@Sign
                                  pw.Container(
                                    height: 20,
                                    width: 20,
                                    child: pw.Text('a'),
                                  ),
                                  //email
                                  pw.Text('elelanv@gamil.com')
                                ]))
                          ]),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Container(
                                child: pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: <pw.Widget>[
                                  //Location Icon Icon
                                  pw.Container(
                                    height: 20,
                                    width: 20,
                                    child: pw.Text('a'),
                                  ),
                                  //Address
                                  pw.Text('Colombo, Sri Lanka')
                                ])),
                          ])
                    ])),
                pw.Partition(
                  width: sep,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: <pw.Widget>[
                        pw.Container(
                          width: 100,
                          height: 100,
                          decoration: pw.BoxDecoration(borderRadius: pw.BorderRadius.circular(8), border: pw.Border.all(width: 0.5)),
                          child: pw.ClipRRect(
                            horizontalRadius: 8,
                            verticalRadius: 8,
                            child: pw.Image(profileImage, width: 100, height: 100, fit: pw.BoxFit.cover,)
                          ),
                        )
                      ]),
                ),
              ])),
          pw.Container(
              padding: pw.EdgeInsets.only(top: 15),
              child: pw.Row(
                  //mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          //color: PdfColors.pink,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                mainAxisSize: pw.MainAxisSize.min,
                                children: <pw.Widget>[
                          ContentHeader(title: 'Experience'),
                          ContentBody(
                            title: 'Trainee Software Engineer (Android)',
                            subtitle: 'Bellvantage'
                          ),
                          ContentHeader(title: 'Projects'),
                          ContentHeader(title: 'Education'),
                        ]))),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                        flex: 2,
                        child: pw.Container(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                mainAxisSize: pw.MainAxisSize.min,
                                children: <pw.Widget>[
                              ContentHeader(title: 'Skills'),
                              ContentHeader(title: 'Languages'),
                              ContentHeader(title: 'Find me online'),
                              ContentHeader(title: 'Passions'),
                            ])))
                  ])),
        ];
      },
      footer: _buildFooter
    ),
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
          fontSize: 12,
          color: PdfColors.white,
        ),
      ),
    ],
  );
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume_bg_2.svg');

  format = format.applyMargin(
      left: 0.5 * PdfPageFormat.cm,
      top: 2.0 * PdfPageFormat.cm,
      right: 0.5 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load('assets/open-sans.ttf')),
      bold: pw.Font.ttf(await rootBundle.load('assets/open-sans-bold.ttf')),
      icons: pw.Font.ttf(await rootBundle.load('assets/material.ttf')),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
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
        child: pw.SvgImage(svg: bgShape)
      );
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
