import 'package:flutter/material.dart';

class P extends Text {
  final Color color;
  final bool? bold;
  final TextAlign? align;

  P(
    super.data, {
    required this.color,
    this.bold = false,
    this.align = TextAlign.center,
    super.key,
  }) : super(
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontWeight: bold! ? FontWeight.w700 : FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: align,
        );
}
