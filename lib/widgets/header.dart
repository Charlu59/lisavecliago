import 'package:flutter/material.dart';
import '../../utils/t_sizes.dart';
import 'design/h1.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    this.title,
    this.rightButton,
    this.leftButton,
  });

  final String? title;
  final Widget? rightButton;
  final Widget? leftButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSizes.headerHeight,
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _leftWidget(),
            Flexible(
              child: H1(title),
            ),
            _rightWidget(),
          ],
        )
      ]),
    );
  }

  Widget _containWidget(Widget? brutWidget) {
    Widget newWidget =
        (brutWidget == null) ? const SizedBox(width: 64.0) : brutWidget;
    return newWidget;
  }

  Widget _leftWidget() {
    return _containWidget(leftButton);
  }

  Widget _rightWidget() {
    return _containWidget(rightButton);
  }
}
