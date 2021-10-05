import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/nav_pages/drafted_messages_page/widgets/app/data.dart';
import 'package:hng/ui/nav_pages/drafted_messages_page/widgets/app/drafted_item_widget.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'drafted_message_page_viewmodel.dart';

class DraftedMessagePage extends StatelessWidget {
  const DraftedMessagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DraftedMessagePageModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: ZuriTopBar(
                leading: Icons.arrow_back_ios,
                leadingPress: () => model.navigateBack(),
                orgTitle: Text(Draft, style: AppTextStyles.heading7,),
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
                child: const Icon(
                  Icons.open_in_new_outlined,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xff00B87C),
              ),
            ),
        viewModelBuilder: () => DraftedMessagePageModel());
  }
}
