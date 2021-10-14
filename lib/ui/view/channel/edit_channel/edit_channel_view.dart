import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import 'edit_channel_view_model.dart';
import 'edit_channel_view.form.dart';
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
  EditChannelPageView({Key? key, this.channelName, this.channelId})
      : super(key: key);
  final String? channelName;
  final String? channelId;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<EditChannelViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.setChannelID(channelId.toString());
      },
      viewModelBuilder: () => EditChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.arrow_back_ios,
          orgTitle: Text(
            local!.editChannel,
            style: AppTextStyles.heading7,
          ),
          whiteBackground: true,
          actions: [
            InkWell(
              onTap: () {},
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    local.save,
                    style: AppTextStyles.heading4.copyWith(
                      color: AppColors.appBarGreen,
                    ),
                  ),
                ),
              ),
            )
          ],
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
                  channelName!,
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
                onChanged: model.onChanged,
                hint: local.addTopic,
                controller: topicController,
              ),
              const TextHeader(headerText: ChannelDescription),
              TextBox(
                  onChanged: model.onChanged,
                  hint: local.description,
                  controller: descriptionController),
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
