import 'package:flutter/material.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants/app_strings.dart';
import '../../../shared/shared.dart';
import '../../../shared/zuri_appbar.dart';
import 'terms_and_conditions_view_model.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsAndConditionsViewModel>.nonReactive(
        viewModelBuilder: () => TermsAndConditionsViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
              leading: Icons.arrow_back,
              whiteBackground: true,
              orgTitle: Text(
                TnC2.toUpperCase(),
                style: AppTextStyles.heading4,
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
                style: AppTextStyle.darkGreySize16,
              ),
            ),
          );
        });
  }
}
