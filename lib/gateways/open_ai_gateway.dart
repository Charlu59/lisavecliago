import 'package:dio/dio.dart';
import 'dart:convert';

import '../screens/reading/word.dart';

class OpenAIGateway {
  static String kOpenAIApiKey =
      "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";
  static String kOpenAIUrl = "https://api.openai.com/v1/chat/completions";

  static Future<List<Word>> retrieveWordsList(
    String phoneme,
  ) async {
    Map<String, dynamic> data = {
      'model': 'gpt-4o',
      'messages': [
        {
          'role': 'system',
          'content': 'You are a language expert for young children.'
        },
        {
          'role': 'user',
          'content':
              """Provide a list of 20 French vocabulary words that contain the phoneme "$phoneme". The words should specifically include the nasal sound "$phoneme" and should be appropriate for children aged 6-12 years. For each word, also provide the pronunciation in phonetic transcription and the French definition for children aged 6-12 years. Your answer should follow the JSON structure: [{"word":<word>,"phonetic":<phonetic>,"definition":<definition>}]"""
        }
      ]
    };

    Response response = await Dio().post(
      kOpenAIUrl,
      data: data,
      options: Options(
          headers: {"Authorization": "Bearer $kOpenAIApiKey"},
          contentType: "application/json; charset=UTF-8"),
    );

    String jsonString = response.data['choices']?[0]['message']?['content'];
    print(jsonString);
    jsonString = _extractJson(jsonString);
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Word> words = jsonList.map((json) => Word.fromJson(json)).toList();
    print("DATA : $data");
    return words;
  }

  static String _extractJson(String apiResponse) {
    final regex = RegExp(r'\[.*?\]', dotAll: true);
    final match = regex.firstMatch(apiResponse);

    if (match != null) {
      return match.group(0)!;
    } else {
      throw const FormatException('No valid JSON found in the response.');
    }
  }
}
