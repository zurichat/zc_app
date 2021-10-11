import 'package:flutter/material.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import '../../../general_widgets/custom_text.dart';
import '../../shared/shared.dart';
import 'do_not_disturb_viewmodel.dart';



class DoNotDisturbView extends StatelessWidget {


  const DoNotDisturbView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoNotDisturbViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            'Do not disturb',
            style: AppTextStyles.heading4,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.zuriPrimaryColor),
              ),
            )

          ],
        ),
        body: Column(
          children: [
            Visibility(child: InkWell(child: const Text('Turn off',
              style: TextStyle(color: AppColors.numberContainerColor),),
             onTap: (){model.resumeNotification();},), visible: model.notifsOn),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                itemCount: model.doNotDisturbTimes.length,
                itemBuilder: (context, index) => ListTile(
                  title: CustomText(text: model.doNotDisturbTimes[index]),
                  leading: Radio(
                    activeColor: AppColors.zuriPrimaryColor,
                    value: index,
                    groupValue: model.currentValue,
                    onChanged: model.changeTime,
                  ),
                ),
              ),
            ),
             Visibility(
                child:  const Text('Paused Notification until',
                  style: TextStyle(color: AppColors.zuriPrimaryColor)),
              visible: model.notifsOn,)
          ],
        ),
      ),
      viewModelBuilder: () => DoNotDisturbViewModel(),
    );

  }
}
