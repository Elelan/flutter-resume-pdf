import 'package:flutter_resume_pdf/model/languages.dart';
import 'package:flutter_resume_pdf/model/online_info.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ContentExtra extends pw.StatelessWidget {
  ContentExtra({this.tagList, this.languageList, this.onlineList});

  final tagList;
  final List<Language> languageList;
  final List<OnlineInfo> onlineList;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: tagList != null
            ? pw.GridView(
                childAspectRatio: 0.3,
                crossAxisCount: 4,
                children: List<pw.Widget>.generate(
                    tagList.length, (int index) => _tagList(tagList[index])))
            : languageList != null
                ? pw.ListView.builder(
                    itemBuilder: (context, index) {
                      return _languageList(languageList[index]);
                    },
                    itemCount: languageList.length)
                : onlineList != null
                    ? _onlineInfo()
                    : pw.Text(
                        'null',
                      ));
  }

  _tagList(String tag) {
    return pw.Container(
        decoration: pw.BoxDecoration(borderRadius: pw.BorderRadius.circular(3)),
        padding: pw.EdgeInsets.only(left: 2, right: 2),
        margin: pw.EdgeInsets.symmetric(vertical: 1, horizontal: 2),
        child: pw.FittedBox(
            child: pw.Text(tag,
                style: pw.TextStyle(
                    fontStyle: pw.FontStyle.italic,
                    background: pw.BoxDecoration()))));
  }

  _languageList(Language lng) {
    return pw.Container(
        height: 35,
        child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: <pw.Widget>[
              pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: <pw.Widget>[
                            pw.Text(lng.language),
                            pw.Text(lng.level,
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                          ]))),
              pw.Expanded(
                  flex: 1, child: pw.Container(child: _skillView(lng.point))),
            ]));
  }

  _skillView(int point) {
    return pw.ListView.builder(
        direction: pw.Axis.horizontal,
        itemBuilder: (ctx, index) {
          return pw.Container(
              child: pw.CircularProgressIndicator(
                value: point.floorToDouble(),
                strokeWidth: 5,
                color: index < point ? PdfColors.blue : PdfColors.grey,
                backgroundColor: index < point ? PdfColors.blue : PdfColors.grey,
              ),
              margin: pw.EdgeInsets.only(right: 3),
              height: 10,
              width: 10,
              //padding: pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(
                  //color: index < point ? PdfColors.blue : PdfColors.grey,
                  //borderRadius: pw.BorderRadius.circular(5),
                  //border: pw.Border.all(color: PdfColors.black, width: 0.5, style: pw.BorderStyle.dotted)
                  //border: pw.Border.all(color: PdfColors.black, width: 0.5)
                  ));
        },
        itemCount: 5);
  }

  _onlineInfo() {
    return pw.ListView.builder(
        itemBuilder: (ctx, index) {
          final onlineInfo = onlineList[index];
          return pw.Container(
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: <pw.Widget>[
                pw.Container(
                    height: 20,
                    width: 15,
                    //child: IconMdl(onlineInfo.iconData, 15, PdfColors.blue)
                    child: pw.Image(onlineInfo.imageProvider)),
                pw.Container(
                  padding: pw.EdgeInsets.only(left: 10),
                  height: 20,
                  child: onlineInfo.url.isNotEmpty
                      ? pw.UrlLink(
                          destination: onlineInfo.url,
                          child: pw.Text(onlineInfo.name,
                              style: pw.TextStyle(
                                  color: PdfColors.black, fontSize: 10)))
                      : pw.Text(onlineInfo.name,
                          style: pw.TextStyle(
                              color: PdfColors.black, fontSize: 10)),
                )
              ]));
        },
        itemCount: onlineList.length);
  }
}
