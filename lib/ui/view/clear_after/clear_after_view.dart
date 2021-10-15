import 'package:flutter/material.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import '../../../general_widgets/custom_text.dart';
import '../../shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'clear_after_viewmodel.dart';
import 'widget/date_and_time.dart';

class ClearAfterView extends StatelessWidget {
  const ClearAfterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final width = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ClearAfterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            local!.clearAfter,
            style: AppTextStyles.heading7,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: model.clearAfterTimes.length,
                itemBuilder: (context, index) => ListTile(
                  title: CustomText(text: model.clearAfterTimes[index]),
                  leading: Radio(
                    activeColor: AppColors.zuriPrimaryColor,
                    value: index,
                    groupValue: model.currentValue,
                    onChanged: model.changeTime,
                  ),
                ),
              ),
            ),
            model.lastIndex
                ? Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.15, right: width * 0.05),
                      child: const DateAndTime(),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      viewModelBuilder: () => ClearAfterViewModel(),
    );
  }
}
