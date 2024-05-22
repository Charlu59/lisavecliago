class Word {
  final String word;
  final String phonetic;
  final String definition;

  Word({required this.word, required this.phonetic, required this.definition});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      phonetic: json['phonetic'],
      definition: json['definition'],
    );
  }
}
