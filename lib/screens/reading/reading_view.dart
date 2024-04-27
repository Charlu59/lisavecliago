import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:lazx/lazx.dart';
import 'package:lisavecliago/widgets/design/h3.dart';

import '../../utils/t_colors.dart';
import '../../widgets/default_scaffold.dart';
import 'reading_viewmodel.dart';

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
        child: Center(
          child: H3(
            'Reading',
            color: TColors.white,
          ),
        ),
      ),
    );
  }
}
