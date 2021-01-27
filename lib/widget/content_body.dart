import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ContentBody extends pw.StatelessWidget {

  ContentBody({this.title, this.subtitle, this.fromDate, this.toDate, this.location, this.list});

  final String title;
  final String subtitle;
  final String fromDate;
  final String toDate;
  final String location;
  final List<String> list;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        padding: pw.EdgeInsets.only(top: 5, bottom: 10),
        decoration: pw.BoxDecoration(
          //border: pw.Border.all(color: PdfColors.grey),
        ),
        child: pw.Column(children: <pw.Widget>[
          _ContentTitle(title),
          _ContentSubTitle(subtitle),
          _ListPoints()
        ]));
  }
}

class _ContentTitle extends pw.StatelessWidget {
  final String title;

  _ContentTitle(this.title);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        alignment: pw.Alignment.topLeft,
        child: pw.Text(title, style: pw.TextStyle(fontSize: 13)));
  }
}

class _ContentSubTitle extends pw.StatelessWidget {
  final String subTitle;

  _ContentSubTitle(this.subTitle);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        alignment: pw.Alignment.topLeft,
        decoration: pw.BoxDecoration(),
        child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Text(subTitle),
              ),
              pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                              child: pw.Row(children: <pw.Widget>[
                            pw.Text('a'),
                            pw.Text('from to')
                          ])),
                        ),
                        pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                                child: pw.Row(children: <pw.Widget>[
                              pw.Text('a'),
                              pw.Text('location')
                            ])))
                      ])))
            ]));
  }
}

class _ListPoints extends pw.StatelessWidget {
  var list = [
    "Lankabell Employee Apps development",
    "Developed multiple apps with background sync, geo tracking, payment collection`"
  ];

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.Column(
            children: List<pw.Widget>.generate(list.length, (index) {
          final p = list[index];
          return pw.Bullet(text: p, style: pw.TextStyle(font: pw.Font.courier(), fontSize: 9,), bulletShape: pw.BoxShape.rectangle, bulletSize: 1.0 * PdfPageFormat.mm);
        })));
  }
}
