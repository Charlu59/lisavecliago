import 'package:flutter/material.dart';

class WordItem extends StatelessWidget {
  final String word;
  final Function(String) onWordTap;

  const WordItem({super.key, required this.word, required this.onWordTap});

  void _onWordTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Vous avez cliqué sur $word')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onWordTap(context),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          word,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
