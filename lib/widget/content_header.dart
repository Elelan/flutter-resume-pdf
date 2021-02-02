import 'package:pdf/widgets.dart' as pw;

class ContentHeader extends pw.StatelessWidget {
  ContentHeader({this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Header(
        child: pw.Container(
      child: pw.Text(title.toUpperCase(), style: pw.TextStyle(fontSize: 15)),
      //color: PdfColors.blue
    ));
  }
}
