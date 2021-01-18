import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ContentBody extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        padding: pw.EdgeInsets.only(top: 5, bottom: 10),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.grey),
        ),
        child: pw.Column(children: <pw.Widget>[
          _ContentTitle(),
          _ContentSubTitle(),
          _ListPoints()
        ]));
  }
}

class _ContentTitle extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        alignment: pw.Alignment.topLeft,
        decoration: pw.BoxDecoration(),
        child: pw.Text('title',
            textScaleFactor: 1.5, textAlign: pw.TextAlign.left));
  }
}

class _ContentSubTitle extends pw.StatelessWidget {
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
                child: pw.Text('subtitle', textScaleFactor: 1.3),
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
    "Worked with team of 5 members and provided end-to-end solutions for clients",
    "Lead developer in 3 key projects of major clients",
    "Created an app which ranked in top 10 for 2 months"
  ];

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        decoration: pw.BoxDecoration(),
        child: pw.Column(
            children: List<pw.Widget>.generate(list.length, (index) {
          final p = list[index];
          return pw.Bullet(text: p);
        })));
  }
}
