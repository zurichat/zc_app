import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/ui_helpers.dart';
import 'package:zurichat/ui/view/channel/share_message/share_message_viewmodel.dart';
import 'package:zurichat/ui/view/channel/share_message/widgets/select_channel_drop_down.dart';
import 'package:zurichat/ui/view/channel/share_message/widgets/share_message_textfield.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ShareMessageHook extends HookViewModelWidget<ShareMessageViewModel> {
  final UserPost userPost;

  const ShareMessageHook({Key? key, required this.userPost})
      : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
      BuildContext context, ShareMessageViewModel viewModel) {
    var controller = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpaceSmall,
        SelectChannelDropDown(
            values: viewModel.data!,
            value: viewModel.homeItemModel,
            onChanged: viewModel.onChanged),
        UIHelper.verticalSpaceMedium,
        ShareMessageTextField(
            controller: controller,
            onChanged: (String value) => viewModel.message = value,
            hintText: EnterMessage),
        UIHelper.customVerticalSpace(10),
        Row(
          children: [
            Image.asset(userPost.userImage!, height: 20, width: 20),
            UIHelper.customHorizontalSpace(10),
            Text(userPost.displayName!, style: AppTextStyle.darkGreySize14),
          ],
        ),
        UIHelper.customVerticalSpace(10),
        Text(userPost.message!,
            style: AppTextStyle.darkGreySize14.copyWith(fontSize: 16)),
        Text('Thread in #${userPost.channelName} • ${userPost.moment}',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: AppTextStyle.lightGreySize12
                .copyWith(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
