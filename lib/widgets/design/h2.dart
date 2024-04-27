import 'package:flutter/material.dart';

class H2 extends Text {
  final Color color;

  H2(
    super.data, {
    required this.color,
    super.key,
  }) : super(
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        );
}
