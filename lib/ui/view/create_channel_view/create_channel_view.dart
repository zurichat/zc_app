import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import '../../shared/ui_helpers.dart';
import 'create_channel_viewmodel.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_text_widget.dart';

class CreateChannelView extends StatelessWidget {
  const CreateChannelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateChannelViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: ZuriAppBar(
                actions: const [
                  Center(
                    child: CustomTextWidget(
                        padding: 17,
                        fontWeight: FontWeight.bold,
                        text: Create,
                        color: AppColors.zuriPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
                leading: Icons.arrow_back_ios,
                leadingPress: () => model.navigateBack(),
                whiteBackground: true,
                orgTitle: Text(
                  Channels,
                  style: AppTextStyles.heading7,
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: Name,
                            fontWeight: FontWeight.w500,
                          ),
                          UIHelper.verticalSpaceMedium,
                          const CustomTextWidget(
                            text: '# e.g. music room',
                            fontSize: 14,
                            color: AppColors.greyishColor,
                          ),
                        ],
                      ),
                    ),
                    const CustomTextField(),
                    UIHelper.verticalSpaceMedium,
                    const Divider(
                      color: AppColors.greyishColor,
                      thickness: 1,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: Description,
                            fontWeight: FontWeight.w500,
                          ),
                          UIHelper.verticalSpaceMedium,
                          const CustomTextWidget(
                            text: AboutChannel,
                            color: AppColors.greyishColor,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                    const CustomTextField(),
                    UIHelper.verticalSpaceMedium,
                    const Divider(
                      color: AppColors.greyishColor,
                      thickness: 1,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: ChannelSettings,
                          ),
                          UIHelper.verticalSpaceMedium,
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: AppColors.blueColor,
                            value: true,
                            onChanged: (_) {},
                            title: const CustomTextWidget(
                              text: MakePrivate,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium,
                          const CustomTextWidget(
                            text: PrivateDescription,
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
