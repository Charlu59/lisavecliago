import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

import 'root_router.dart';
import 'routes/reading_route_builder.dart';
import 'routes/splash_route_builder.dart';

class RootNavigator extends StatefulWidget {
  static final RootNavigator _instance = RootNavigator._internal();
  factory RootNavigator() => _instance;
  RootNavigator._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onForegroundGained: () {
        // SessionService().startSession();
      },
      onForegroundLost: () {
        // SessionService().endSession();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: widget.navigatorKey,
        builder: (context, child) {
          return child!;
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            bool isEnable = (settings.arguments ?? false) as bool;
            return SplashRouteBuilder(
              isEnable: isEnable,
            );
          }
          if (settings.name == '/reading') {
            return ReadingRouteBuilder();
          }

          return null;
        },
        initialRoute: '/',
      ),
    );
  }

  //MARK: Life cycle
  @override
  void initState() {
    super.initState();
    _initializeApp().then((_) {
      // AnalyticsService.logEvent(AnalyticEvent.appAppLaunched);
      RootRouter.launchApp();
    });
  }

  //MARK: APP init
  _initializeApp() async {
    // await AnalyticsService.init();
    // await AnalyticsService.grantAnalytics();
    // await LocalDatabaseService().init();
  }

  @override
  void dispose() async {
    super.dispose();
    // await LocalDatabaseService().dispose();
  }
}
