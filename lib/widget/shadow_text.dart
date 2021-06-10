import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {this.style}) : assert(data != null);
  final String data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
              top: 5,
              left: 5,
              child: Text(
                data,
                style: style.copyWith(color: Colors.black.withOpacity(0.7)),
              )),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Text(
              data,
              style: style,
            ),
          )
        ],
      ),
    );
  }
}
