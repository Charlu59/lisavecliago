import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'navigator/root_navigator.dart';

const String kSentryKey =
    'https://46b76471f4d9279188eb15489105c40a@o4506288326705152.ingest.sentry.io/4506288327819264';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = kSentryKey;
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(const MyApp()),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RootNavigator();
  }
}
