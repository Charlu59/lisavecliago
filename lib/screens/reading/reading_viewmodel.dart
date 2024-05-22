import 'package:lazx/lazx.dart';
import 'package:lisavecliago/screens/reading/word.dart';
import 'package:lisavecliago/service/ai_service.dart';

import '../../service/recorder_service.dart';

class SplashViewModel extends LazxViewModel {
  LazxData<List<Word>> words = LazxData<List<Word>>([]);

  @override
  List<LazxObservable> get props => [words];

  launchListening() async {
    print("Listening");
    const String phoneme = "ɑ̃";
    List<Word> allWords = await AIService.retrieveWords(phoneme);
    words.push(allWords);
  }

  @override
  void dispose() {
    // videoController.dispose();
    super.dispose();
  }
}
