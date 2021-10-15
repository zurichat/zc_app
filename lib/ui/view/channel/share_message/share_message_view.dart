import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/ui/view/channel/share_message/share_message_viewmodel.dart';
import 'package:hng/ui/view/channel/share_message/widgets/select_channel_drop_down.dart';
import 'package:hng/ui/view/channel/share_message/widgets/share_message_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ShareMessageView extends StatelessWidget {
  final UserPost userPost;

  const ShareMessageView({required this.userPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShareMessageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.zuriPrimaryColor,
                leading: IconButton(
                    onPressed: model.close, icon: const Icon(Icons.close)),
                centerTitle: false,
                title: const Text(ShareMessage),
                actions: [
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => model.sendMessage(userPost.message!),
                    ),
                  )
                ],
              ),
              body: model.isBusy
                  ? const ZuriLoader()
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: ShareMessageHook(userPost: userPost),
                    ),
            ),
        viewModelBuilder: () => ShareMessageViewModel());
  }
}

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
            Text(userPost.displayName!, style: AppTextStyles.body3Medium),
          ],
        ),
        UIHelper.customVerticalSpace(10),
        Text(userPost.message!,
            style: AppTextStyles.body3Medium.copyWith(fontSize: 16)),
        Text('Thread in #${userPost.channelName} • ${userPost.moment}',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: AppTextStyles.faintBodyText
                .copyWith(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
