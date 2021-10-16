import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/smart_widgets/text_parser/text_parser_view.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../channel_page_viewmodel.dart';

class ChannelIntro extends ViewModelWidget<ChannelPageViewModel> {
  const ChannelIntro({
    Key? key,
    required this.channelName,
    required this.channelId,
  }) : super(key: key);

  final String channelName;
  final String channelId;
  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    final local = AppLocalization.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#$channelName",
            style: AppTextStyle.darkGreySize16Bold,
          ),
          const SizedBox(height: 10),
          TextParser(
              '@ ${viewModel.channelCreator} ${local!.createdThisChannel}. ${local.channelIntroText} #$channelName ${local.channel}.'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  MaterialButton(
                    onPressed: () =>
                        viewModel.navigateToChannelEdit(channelName, channelId),
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                        side: BorderSide(color: AppColors.zuriPrimaryColor)),
                    child: SvgPicture.asset(
                      Add_Description,
                      color: AppColors.zuriPrimaryColor,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    local.description,
                    style: AppTextStyle.lightGreySize14,
                  )
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () =>
                        viewModel.navigateToAddPeople(channelName, channelId),
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                        side: BorderSide(color: AppColors.zuriPrimaryColor)),
                    child: SvgPicture.asset(
                      add_people,
                      color: AppColors.zuriPrimaryColor,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    local.addPeople,
                    style: const TextStyle(
                      color: AppColors.greyishColor,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(children: [
              const Expanded(
                  child: Divider(
                endIndent: 1,
                color: AppColors.greyishColor,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    local.today,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.lightGreySize12,
                  ),
                ),
              ),
              const Expanded(
                  child: Divider(
                indent: 1,
                color: Colors.black,
              )),
            ]),
          )
        ],
      ),
    );
  }
}
