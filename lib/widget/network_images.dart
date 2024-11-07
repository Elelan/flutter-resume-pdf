
import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Load an image from an asset bundle key.
Future<pw.ImageProvider> imageFromAssetBundle(String key,
    [AssetBundle? bundle]) async {
  bundle ??= rootBundle;
  final data = await bundle.load(key);
  return pw.MemoryImage(data.buffer.asUint8List());
}

// Future<pw.ImageProvider> networkImage(
//     String url, {
//       bool cache = true,
//       PdfImageOrientation orientation,
//       double dpi,
//     }) async {
//   final img = await download(url, cache: cache);
//   return pw.MemoryImage(img, orientation: orientation, dpi: dpi);
// }
//
// Future<Uint8List> download(
//     String url, {
//       bool cache = true,
//     }) async {
//   File file;
//   if (cache) {
//     final tmp = await pp.getTemporaryDirectory();
//     file = File('${tmp.path}/${url.hashCode}');
//     if (file.existsSync()) {
//       return await file.readAsBytes();
//     }
//   }
//
//   print('Downloading $url');
//   final client = HttpClient();
//   final request = await client.getUrl(Uri.parse(url));
//   final response = await request.close();
//   final builder = await response.fold(
//       BytesBuilder(), (BytesBuilder b, List<int> d) => b..add(d));
//   final List<int> data = builder.takeBytes();
//
//   if (cache) {
//     await file.writeAsBytes(data);
//   }
//   return Uint8List.fromList(data);
// }