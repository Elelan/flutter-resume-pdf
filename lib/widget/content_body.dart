import 'package:flutter/services.dart';
import 'package:flutter_resume_pdf/model/content_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ContentBody extends pw.StatelessWidget {
  ContentBody(this.model);

  final ContentModel model;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        decoration: pw.BoxDecoration(
            //border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey, width: 2)),
            ),
        child: pw.Column(children: <pw.Widget>[
          _ContentTitle(model.title),
          _ContentSubTitle(model),
          _ListPoints(model.descPoints)
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
  final ContentModel model;

  _ContentSubTitle(this.model);

  late pw.Font material;

  @override
  pw.Widget build(pw.Context context) {
    _material().then((value) => {material = value});

    return pw.Container(
        alignment: pw.Alignment.topLeft,
        decoration: pw.BoxDecoration(),
        child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Text(model.subTitle.isEmpty
                  ? '[${model.tags?.join(', ')}]'
                  : model.subTitle , style: pw.TextStyle(fontSize: 10)),
              if (model.address.isNotEmpty)
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                              child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                pw.Expanded(
                                  flex: 1,
                                  child: pw.Container(
                                      child: pw.Row(children: <pw.Widget>[
                                    pw.Container(
                                        //child: pw.Icon(const pw.IconData(0xea91)) //f073 //e109
                                        child: pw.Icon(
                                      const pw.IconData(0xe865),
                                      size: 15,
                                          color: PdfColors.grey500
                                    )),
                                    pw.Text(model.startDate),
                                    pw.Text(' - '),
                                    pw.Text(model.endDate)
                                  ])),
                                ),
                                pw.Expanded(
                                    flex: 1,
                                    child: pw.Container(
                                        child: pw.Row(children: <pw.Widget>[
                                      pw.Container(
                                          child: pw.Icon(
                                        const pw.IconData(0xe0c8),
                                        size: 15,
                                            color: PdfColors.grey500
                                      ) //f073 //e109
                                          ),
                                      pw.Text(model.address)
                                    ])))
                              ])))
                    ])
            ]));
  }

  Future<pw.Font> _material() async {
    return pw.Font.ttf(
        await rootBundle.load('assets/fonts/MaterialIcons-Regular.ttf'));
  }
}

class _ListPoints extends pw.StatelessWidget {
  _ListPoints(this.list);

  final list;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.Column(
            children: List<pw.Widget>.generate(list.length, (index) {
      final p = list[index];
      return pw.Bullet(
        padding: pw.EdgeInsets.zero,
          text: p,
          style: pw.TextStyle(
            //font: pw.Font.courier(),
            fontSize: 10,
            lineSpacing: 0,
            decorationThickness: 0
          ),
          bulletShape: pw.BoxShape.rectangle,
          bulletSize: 1.0 * PdfPageFormat.mm);
    })));
  }
}
