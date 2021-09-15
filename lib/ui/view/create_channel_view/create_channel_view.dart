import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/ui_helpers.dart';
import 'package:hng/ui/view/create_channel_view/widgets/custom_text_field.dart';
import 'package:hng/ui/view/create_channel_view/widgets/custom_text_widget.dart';
import 'package:stacked/stacked.dart';

import 'create_channel_viewmodel.dart';

class CreateChannelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateChannelViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leadingWidth: double.infinity,
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                      padding: 17,
                      fontWeight: FontWeight.bold,
                      text: 'Cancel',
                      color: AppColors.zuriPrimaryColor,
                      decoration: TextDecoration.underline),
                ),
                title: Text(
                  'Channels',
                  style: AppTextStyles.heading5.copyWith(
                      fontSize: 20,
                      color: AppColors.deepBlackColor,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  Center(
                    child: CustomTextWidget(
                        padding: 17,
                        fontWeight: FontWeight.bold,
                        text: 'Create',
                        color: AppColors.zuriPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Name',
                            fontWeight: FontWeight.w500,
                          ),
                          UIHelper.verticalSpaceMedium,
                          CustomTextWidget(
                            text: '# e.g. music room',
                            fontSize: 14,
                            color: AppColors.greyishColor,
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(),
                    UIHelper.verticalSpaceMedium,
                    Divider(
                      color: AppColors.greyishColor,
                      thickness: 1,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Description',
                            fontWeight: FontWeight.w500,
                          ),
                          UIHelper.verticalSpaceMedium,
                          CustomTextWidget(
                            text: "What's this channel about?",
                            color: AppColors.greyishColor,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                    CustomTextField(),
                    UIHelper.verticalSpaceMedium,
                    Divider(
                      color: AppColors.greyishColor,
                      thickness: 1,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Channel Settings',
                          ),
                          UIHelper.verticalSpaceMedium,
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: AppColors.blueColor,
                            value: true,
                            onChanged: (_) {},
                            title: CustomTextWidget(
                              text: 'Make Private',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium,
                          CustomTextWidget(
                            text:
                                'When channel is set to private, members of your workspace can only view or join by invitation',
                            color: AppColors.greyishColor,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => CreateChannelViewModel());
  }
}
