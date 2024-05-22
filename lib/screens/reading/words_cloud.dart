import 'package:flutter/material.dart';
import 'package:lisavecliago/screens/reading/word.dart';

import 'word_item.dart';

class WordsCloud extends StatelessWidget {
  final List<Word> words;
  final Function(Word) onWordTap;

  const WordsCloud({super.key, required this.words, required this.onWordTap});

  @override
  Widget build(BuildContext context) {
    List<Widget> wordWidgets = [];

    for (int i = 0; i < words.length; i++) {
      String wordString = words[i].word;
      wordWidgets.add(
        WordItem(
          word: wordString,
          onWordTap: (word) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Vous avez cliqué sur $word')),
            );
          },
        ),
      );
      if (i != words.length - 1) {
        wordWidgets.add(const Text('.',
            style: TextStyle(fontSize: 20, color: Colors.white)));
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: wordWidgets,
    );
  }
}
