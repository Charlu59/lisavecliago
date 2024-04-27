import 'package:flutter/material.dart';

import '../utils/t_colors.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.child,
    this.header,
    this.bottombar,
    this.resizeToAvoidBottomInset = false,
  });

  final Widget child;
  final Widget? header;
  final Widget? bottombar;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: TColors.black,
        ),
        Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              header ?? Container(),
              Expanded(child: child),
            ],
          ),
          bottomNavigationBar: bottombar,
        ),
      ],
    );
  }
}
