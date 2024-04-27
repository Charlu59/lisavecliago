import 'package:lazx/lazx.dart';

import '../../navigator/root_router.dart';

class SplashViewModel extends LazxViewModel {
  @override
  List<LazxObservable> get props => [];

  onSkip() {
    // AnalyticsService.logEvent(AnalyticEvent.splashSkipTapped);
    RootRouter.onSkipSplashScreen();
  }

  @override
  void dispose() {
    // videoController.dispose();
    super.dispose();
  }
}
