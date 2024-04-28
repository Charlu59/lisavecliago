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
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
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


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'audio_player.dart';
// import 'audio_recorder.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool showPlayer = false;
//   String? audioPath;

//   @override
//   void initState() {
//     showPlayer = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: showPlayer
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: AudioPlayer(
//                     source: audioPath!,
//                     onDelete: () {
//                       setState(() => showPlayer = false);
//                     },
//                   ),
//                 )
//               : Recorder(
//                   onStop: (path) {
//                     if (kDebugMode) print('Recorded file path: $path');
//                     //TODO: send to Whisper AI
//                     //
//                     setState(() {
//                       audioPath = path;
//                       showPlayer = true;
//                     });
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }
