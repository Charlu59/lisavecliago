import 'root_navigator.dart';

class RootRouter {
  static get context {
    return RootNavigator().navigatorKey.currentContext!;
  }

  static back() {
    // AnalyticsService.logEvent(AnalyticEvent.rootBackTapped);
    RootNavigator().navigatorKey.currentState?.pop();
  }

  static backToStoryboard() {
    // AnalyticsService.logEvent(AnalyticEvent.rootBackTapped);
    RootNavigator().navigatorKey.currentState?.pop();
    RootNavigator().navigatorKey.currentState?.pop();
  }

  static launchApp() async {
    // SessionService().startSession();
    // AnalyticsService.logAppOpen();
    if (await _needToUpdate()) {
      return;
    }
    RootNavigator().navigatorKey.currentState?.pushNamed(
          "/",
          arguments: true,
        );
  }

  static _needToUpdate() async {
    // AppStatus? appStatus = await ConfigService().updateAppState();
    // print("AppStatus : ${appStatus?.version}");
    // print("User : ${await Me().userId} - ${await Me().uuid}");
    // if (appStatus == null) return false;
    // _showUpdateDialog(appStatus);
    return false;
  }

  // static _showUpdateDialog(AppStatus appStatus) {
  //   PopupPresenter.showUpdatePopup(
  //       appStatus: appStatus,
  //       onSkip: () {
  //         Navigator.of(RootRouter.context).pop();
  //       });
  // }

  static Future<bool> get isNotLoggedIn async {
    // bool isLoggedIn = (await Me().userId) != null;
    // return !isLoggedIn;
    return false;
  }

  static void onSkipSplashScreen() {
    // AnalyticsService.logEvent(AnalyticEvent.splashSkipTapped);
    RootNavigator().navigatorKey.currentState?.pushNamed("/reading");
  }
}
