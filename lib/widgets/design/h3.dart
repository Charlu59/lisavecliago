import 'package:flutter/material.dart';

class H3 extends Text {
  final Color color;

  H3(
    super.data, {
    required this.color,
    super.key,
  }) : super(
          style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        );
}
