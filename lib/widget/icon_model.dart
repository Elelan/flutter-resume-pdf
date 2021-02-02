import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class IconMdl extends pw.StatelessWidget {
  IconMdl(this.codePoint, this.size, this.color);

  final int codePoint;
  final double size;
  final PdfColor color;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Icon(pw.IconData(codePoint), size: size, color: color);
  }
}