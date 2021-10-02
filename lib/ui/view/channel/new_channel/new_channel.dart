import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/constants/app_strings.dart';
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
    return ViewModelBuilder<NewChannelViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => NewChannelViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 2.0,
          leading: IconButton(
            icon: const ImageIcon(
              AssetImage(ArrowIcon),
              size: 12.0,
            ),
            onPressed: () {},
          ),
          title: Text(
            'New Channel',
            style: AppTextStyles.heading7,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(right: 16.0)),
              onPressed: () {
                model.createChannel();
              },
              child: Text(
                Create,
                style: AppTextStyles.heading8.copyWith(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                ),
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
                          ChannelName,
                          style: AppTextStyles.heading9,
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
                          child: CustomTextField(
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.search,
                            autoCorrect: false,
                            obscureText: false,
                            onChanged: model.onChangeChannelNameField,
                            controller: channelNameController,
                            hintText: ChannelTextFieldHint,
                            border: InputBorder.none,
                            formatter: [LengthLimitingTextInputFormatter(80)],
                            style: AppTextStyles.body2Medium.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),

   
                        ),
                        Text(
                          '${model.inputLength}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            // ignore: todo
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
                            ErrorMsg,
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
                      ChannelCreationWarningMsg,
                      style: AppTextStyles.body2Medium,
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
                      ChannelDescription,
                      style: AppTextStyles.heading9,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    height: 180,
                    child: CustomTextField(
                      keyboardType: TextInputType.multiline,
                      maxlines: null,
                      inputAction: TextInputAction.search,
                      autoCorrect: false,
                      obscureText: false,
                      controller: channelDescriptionController,
                      hintText: AddDescription,
                      style: AppTextStyles.body2Medium.copyWith(
                        color: AppColors.blackColor,
                      ),
                      isCollapsed: true,
                    ),

                    // TextField(
                    //   maxLines: null,
                    //   controller: channelDescriptionController,
                    //   style: AppTextStyles.body2Medium.copyWith(
                    //     color: AppColors.blackColor,
                    //   ),
                    //   cursorColor: AppColors.zuriPrimaryColor,
                    //   keyboardType: TextInputType.multiline,
                    //   decoration: InputDecoration.collapsed(
                    //     hintText: 'Add a Desription',
                    //     hintStyle: AppTextStyles.body2Medium.copyWith(
                    //       color: AppColors.zuriDarkGrey,
                    //     ),
                    //   ),
                    // ),
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
                          MakeChannelPrivate,
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
                              PrivateChannelDescription,
                              style: AppTextStyles.body2Medium,
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                // ignore: todo
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
                          'by invitation.',
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
