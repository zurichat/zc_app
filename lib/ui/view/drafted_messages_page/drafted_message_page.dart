import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import './widgets/app/data.dart';
import './widgets/app/drafted_item_widget.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'drafted_message_page_viewmodel.dart';

class DraftedMessagePage extends StatelessWidget {
  const DraftedMessagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DraftedMessagePageModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: ZuriAppBar(
                leading: Icons.arrow_back_ios,
                leadingPress: () => model.navigateBack(),
                orgTitle: Text(
                  Draft,
                  style: AppTextStyle.darkGreySize18Bold,
                ),
                whiteBackground: true,
              ),
              body: ListView.builder(
                  //physics: BouncingScrollPhysics(),
                  itemCount: draftedList.length,
                  itemBuilder: (context, index) {
                    return DraftedItemWidget(
                      username: draftedList[index].username,
                      time: draftedList[index].time,
                      message: draftedList[index].message,
                    );
                  }),
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xff00B87C),
                child: const Icon(
                  Icons.open_in_new_outlined,
                  color: Colors.white,
                ),
              ),
            ),
        viewModelBuilder: () => DraftedMessagePageModel());
  }
}
