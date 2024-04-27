import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:lazx/lazx.dart';

import '../../utils/t_colors.dart';
import '../../utils/t_sizes.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/default_scaffold.dart';
import '../../widgets/design/h2.dart';
import '../../widgets/design/p.dart';
import '../../widgets/header.dart';
import 'splash_viewmodel.dart';

class SplashView extends LazxView<SplashViewModel> {
  final bool isEnable;
  SplashView({
    required this.isEnable,
    Key? key,
  }) : super();

  @override
  SplashViewModel getViewModel() => SplashViewModel();

  @override
  Widget build(BuildContext context, SplashViewModel viewModel) {
    return FocusDetector(
      onVisibilityGained: () {
        // viewModel.launchVideo();
      },
      child: DefaultScaffold(
        resizeToAvoidBottomInset: true,
        header: Header(
          rightButton: Container(
            width: TSizes.iconWitdh,
            height: TSizes.iconWitdh,
            color: TColors.transparent,
            child: DefaultButton(
              title: 'Skip',
              onTap: viewModel.onSkip,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 60.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Container(
                      color: TColors.cyan,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  H2(
                    "Craft Your Company\nBrand Videos Effortlessly.",
                    color: TColors.white,
                  ),
                  const SizedBox(height: 16.0),
                  P(
                    """BrandOn crafts your brand's videos.
All you do? Discuss, shoot, and be amazed 🤩""",
                    color: TColors.greyLight,
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 3,
              child: Center(
                child: SpinKitSpinningLines(
                  color: TColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
