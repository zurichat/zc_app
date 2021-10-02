import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import 'edit_channel_view_model.dart';
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
          appbarTitle: EditChannel,
          appbarAction: Save,
          model: model,
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const TextHeader(headerText: ChannelName),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                margin: _padding,
                child: Text(
                  TeamSocrates,
                  style: AppTextStyles.body1Light,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                margin: _padding,
                child: Text(
                  ChannelCreationWarning,
                  style: AppTextStyles.body2_400,
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              const TextHeader(headerText: ChannelTopic),
              TextBox(
                hint: AddTopic,
                controller: topicController,
              ),
              const TextHeader(headerText: ChannelDescription),
              TextBox(
                  hint: ChannelCreationHint, controller: descriptionController),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffF6F6F6)),
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
