import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import 'editChannelViewModel.dart';
import 'edit_channel_view.form.dart';
import 'widgets/edit_channel_appbar.dart';
import 'widgets/edit_channel_headers.dart';
import 'widgets/edit_channel_text_field.dart';

@FormView(
  fields: [
    FormTextField(name: 'description'),
    FormTextField(name: 'topic'),
  ],
)
class EditChannelPageView extends StatelessWidget with $EditChannelPageView {
  final _padding = const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0);
  EditChannelPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditChannelViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
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
            const SizedBox(height: 20),
            TextHeader(headerText: 'Channel Name'),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: _padding,
              child: Text(
                '#teamsocrates',
                style: AppTextStyles.body1Light,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              margin: _padding,
              child: Text(
                """
Channel names must be lowercase, without spaces or periods, and can't be longer than 80 characters""",
                style: AppTextStyles.body2_400,
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            TextHeader(headerText: 'Channel Topic'),
            TextBox(
              hint: 'Add a topic',
              controller: topicController,
            ),
            TextHeader(headerText: 'Channel Description'),
            TextBox(
                hint: 'Set a description', controller: descriptionController),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xffF6F6F6)),
              height: 90,
            ),
          ]),
        ),
      ),
    );
  }
}
