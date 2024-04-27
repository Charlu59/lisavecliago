import 'package:flutter/material.dart';

import '../../utils/t_colors.dart';
import '../design/p.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: P(title, color: TColors.greyLight),
      ),
    );
  }
}
