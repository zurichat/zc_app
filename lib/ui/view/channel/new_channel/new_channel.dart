import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import '../../../shared/ui_helpers.dart';
import 'new_channel.form.dart';
import 'new_channel_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'channelName'),
  FormTextField(name: 'channelDescription')
])
class NewChannel extends StatelessWidget with $NewChannel {
  NewChannel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<NewChannelViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => NewChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: ZuriAppBar(
          leading: Icons.arrow_back_ios,
          leadingPress: () {},
          orgTitle: Text(
            local!.newChannel,
            style: AppTextStyles.heading7,
          ),
          whiteBackground: true,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(right: 16.0)),
              onPressed: () {
                model.createChannel();
              },
              child: Text(
                local.create,
                style: AppTextStyles.heading8,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, bottom: 10, top: 24),
                    child: Row(
                      children: [
                        Text(
                          local.channelName,
                          style: AppTextStyles.heading9.copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: model.inputError
                            ? AppColors.redColor
                            : AppColors.borderColor,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          hash,
                          style: AppTextStyles.body2Medium.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: channelNameController,
                            style: AppTextStyles.body2Medium.copyWith(
                              color: AppColors.blackColor,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(80)
                            ],
                            cursorColor: AppColors.zuriPrimaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: ChannelTextFieldHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA1A9B2),
                              ),
                            ),
                            onChanged: model.onChangeChannelNameField,
                          ),
                        ),
                        Text(
                          '${model.inputLength}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,

                            //TODO Change to brand colors
                            color: Color(0xFFA1A9B2),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Visibility(
                      visible: model.inputError,
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceSmall,
                          Text(
                            local.errorMessage,
                            style: AppTextStyles.body2Medium.copyWith(
                              color: AppColors.redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      local.channelCreationWarningMessage,
                      style: AppTextStyles.body2Medium.copyWith(fontSize: 15),
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.greyColor,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 13, bottom: 10),
                    child: Text(
                      local.channelDescription,
                      style: AppTextStyles.heading9,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    height: 180,
                    child: TextField(
                      maxLines: null,
                      controller: channelDescriptionController,
                      style: AppTextStyles.body2Medium.copyWith(
                        color: AppColors.blackColor,
                      ),
                      cursorColor: AppColors.zuriPrimaryColor,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration.collapsed(
                        hintText: local.addDescription,
                        hintStyle: AppTextStyles.body2Medium.copyWith(
                          color: AppColors.zuriDarkGrey,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.greyColor,
                  ),
                  UIHelper.verticalSpaceMedium,
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.navBarItemColor,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.makeChannelPrivate,
                          style: AppTextStyles.heading9.copyWith(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            height: 2.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              local.privateChannelDescription,
                              style: AppTextStyles.body2Medium,
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                //TODO  Change to brand colors
                                inactiveTrackColor: const Color(0xffebebeb),
                                activeColor: AppColors.zuriPrimaryColor,
                                value: model.isChannelPrivate,
                                onChanged: model.toggleSwitch,
                              ),
                            )
                          ],
                        ),
                        //add this part here because the Row
                        //widget won't align with just the
                        //upper part of the text when there's a new line
                        Text(
                          local.byInvitation,
                          style: AppTextStyles.body2Medium,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.navBarItemColor,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
