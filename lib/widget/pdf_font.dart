import 'dart:io';
import 'dart:typed_data';

import 'package:printing/printing.dart';

class PdfFileCache extends PdfBaseCache {
  PdfFileCache({
    String? base,
  }) : base = base ?? '.';

  final String base;

  @override
  Future<void> add(String key, Uint8List bytes) async {
    await File('$base/$key').writeAsBytes(bytes);
  }

  @override
  Future<Uint8List> get(String key) async {
    return await File('$base/$key').readAsBytes();
  }

  @override
  Future<void> clear() async {}

  @override
  Future<bool> contains(String key) async {
    return File('$base/$key').existsSync();
  }

  @override
  Future<void> remove(String key) async {
    File('$base/$key').deleteSync();
  }
}