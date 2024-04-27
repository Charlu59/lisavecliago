import 'package:flutter/material.dart';

class H4 extends Text {
  final Color color;
  final TextAlign? align;

  H4(
    super.data, {
    required this.color,
    this.align = TextAlign.center,
    super.key,
  }) : super(
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        );
}
