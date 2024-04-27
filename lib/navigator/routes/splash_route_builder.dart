import 'package:flutter/material.dart';

import '../../../screens/splash/splash_view.dart';

class SplashRouteBuilder<T> extends PageRouteBuilder<T> {
  SplashRouteBuilder({
    isEnable = false,
  }) : super(
            pageBuilder: (_, __, ___) => SplashView(
                  isEnable: isEnable,
                ));
}
