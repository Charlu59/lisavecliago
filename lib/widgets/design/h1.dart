import 'package:flutter/material.dart';
import '../../utils/t_colors.dart';

class H1 extends StatelessWidget {
  final String? data;

  const H1(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_shadowTitle(), _title()],
    );
  }

  Widget _title() {
    return Text(
      data ?? "",
      style: const TextStyle(
        color: TColors.white,
        fontFamily: 'Poppins',
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _shadowTitle() {
    return Positioned(
      left: 1.0,
      top: 2.0,
      child: Text(
        data ?? "",
        style: const TextStyle(
          color: TColors.shadow,
          fontFamily: 'Poppins',
          fontSize: 32.0,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
