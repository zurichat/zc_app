import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/share_message/share_message_viewmodel.dart';
import 'package:hng/ui/view/channel/share_message/widgets/share_message_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'share_message_view.form.dart';

@FormView(
  fields: [FormTextField(name: 'message')],
)
class ShareMessageView extends StatelessWidget with $ShareMessageView {
  final UserPost userPost;

  ShareMessageView({required this.userPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShareMessageViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: model.close, icon: const Icon(Icons.close)),
                centerTitle: false,
                title: const Text('Share Message'),
                actions: [
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => model.sendMessage(userPost.message!),
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShareMessageTextField(controller: messageController),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(userPost.userImage!, height: 20, width: 20),
                        const SizedBox(width: 10),
                        Text(userPost.displayName!,
                            style: AppTextStyles.body3Medium),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(userPost.message!,
                        style:
                            AppTextStyles.body3Medium.copyWith(fontSize: 16)),
                    Text(
                        'Thread in #${userPost.channelName} • ${userPost.moment}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: AppTextStyles.faintBodyText
                            .copyWith(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ShareMessageViewModel());
  }
}
