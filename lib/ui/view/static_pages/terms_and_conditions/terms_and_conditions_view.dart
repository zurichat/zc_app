import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../../utilities/constants/app_strings.dart';
import '../../../shared/dumb_widgets/zuri_appbar.dart';
import 'terms_and_conditions_view_model.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<TermsAndConditionsViewModel>.nonReactive(
        viewModelBuilder: () => TermsAndConditionsViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
              leading: Icons.arrow_back,
              isDarkMode: dark,
              orgTitle: Text(
                TnC2.toUpperCase(),
                style: AppTextStyle.whiteSize20Bold,
              ),
              leadingPress: () => model.popNavigation(),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Text(
                TermsAndConditions,
                style: dark
                    ? AppTextStyle.whiteSize16
                    : AppTextStyle.darkGreySize16,
              ),
            ),
          );
        });
  }
}
