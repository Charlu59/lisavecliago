import 'dart:math';

import 'package:lisavecliago/screens/reading/word.dart';

import '../gateways/open_ai_gateway.dart';

class AIService {
  static Future<List<Word>> retrieveWords(String phoneme) async {
    List<Word> words = await OpenAIGateway.retrieveWordsList(phoneme);
    return _cleanWords(words, phoneme);
  }

  static List<Word> _cleanWords(List<Word> words, String phoneme) {
    List<Word> cleanedWords = [];
    for (Word word in words) {
      if (word.phonetic.contains(phoneme)) {
        cleanedWords.add(word);
      } else {
        print("Word is not French: ${word.word}");
      }
    }
    return cleanedWords;
  }
}
