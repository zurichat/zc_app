import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/channel/edit_channel/widgets/edit_channel_appbar.dart';
import 'package:hng/ui/view/channel/edit_channel/widgets/edit_channel_headers.dart';
import 'package:hng/ui/view/channel/edit_channel/widgets/edit_channel_text_field.dart';
import '../../../shared/colors.dart';
import 'package:stacked/stacked.dart';
import './editChannelViewModel.dart';

class EditChannelPageView extends StatelessWidget {
  final _padding = const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0);
  const EditChannelPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditChannelViewModel>.reactive(
      viewModelBuilder: () => EditChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBars(
          appbarTitle: 'Edit Channel',
          appbarAction: 'Save',
          model: model,
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 20),
            TextHeader(headerText: 'Channel Name'),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: _padding,
              child: Text(
                '#teamsocrates',
                style: AppTextStyles.body1Light,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              margin: _padding,
              child: Text(
                "Channel names must be lowercase, without spaces or periods, and can't be longer than 80 characters",
                style: AppTextStyles.body2_400,
              ),
            ),
            SizedBox(
              height: 36.0,
            ),
            TextHeader(headerText: 'Channel Topic'),
            TextBox(
              hint: 'Add a topic',
              model: model,
            ),
            TextHeader(headerText: 'Channel Description'),
            TextBox(hint: 'Set a description', model: model),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffF6F6F6)),
              height: 90,
            ),
          ]),
        ),
      ),
    );
  }
}
