import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:lazx/lazx.dart';
import 'package:lisavecliago/screens/reading/words_cloud.dart';

import '../../widgets/default_scaffold.dart';
import 'reading_viewmodel.dart';
import 'word.dart';
import 'word_item.dart';

class ReadingView extends LazxView<SplashViewModel> {
  ReadingView({
    Key? key,
  }) : super();

  @override
  SplashViewModel getViewModel() => SplashViewModel();

  @override
  Widget build(BuildContext context, SplashViewModel viewModel) {
    return FocusDetector(
      onVisibilityGained: () {
        viewModel.launchListening();
      },
      child: DefaultScaffold(
        resizeToAvoidBottomInset: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: LazxBuilder<List<Word>>(
              data: viewModel.words,
              builder: (context, words) {
                return WordsCloud(
                    words: words!,
                    onWordTap: (Word word) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Vous avez cliqué sur ${word.word}')),
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
