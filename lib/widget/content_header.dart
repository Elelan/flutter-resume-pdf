import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class ContentHeader extends pw.StatelessWidget {

  ContentHeader({this.title});
  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Header(
      decoration: pw.BoxDecoration(color: PdfColors.grey),
        child: pw.Text(title.toUpperCase(), textScaleFactor: 1.5)
    );
  }

}