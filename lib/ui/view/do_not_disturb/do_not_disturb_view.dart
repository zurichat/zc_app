import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import 'do_not_disturb_viewmodel.dart';

class DoNotDisturbView extends StatelessWidget {
  const DoNotDisturbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<DoNotDisturbViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          orgTitle: Text(
            local!.doNotDisturb,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          leading: Icons.close_outlined,
          leadingPress: () => model.exitPage(),
          isDarkMode: dark,
          whiteBackground: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                local.save,
                style: AppTextStyle.greenSize16,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                itemCount: model.doNotDisturbTimes.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    model.doNotDisturbTimes[index],
                    style: dark
                        ? AppTextStyle.whiteSize16
                        : AppTextStyle.darkGreySize16,
                  ),
                  leading: Radio(
                    activeColor: AppColors.zuriPrimaryColor,
                    value: index,
                    groupValue: model.currentValue,
                    onChanged: model.changeTime,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DoNotDisturbViewModel(),
    );
  }
}
