import 'package:lazx/lazx.dart';

import '../../service/recorder_service.dart';

class SplashViewModel extends LazxViewModel {
  @override
  List<LazxObservable> get props => [];

  launchListening() {
    print("Listening");
    RecorderService().startRecording();
  }

  @override
  void dispose() {
    // videoController.dispose();
    super.dispose();
  }
}
