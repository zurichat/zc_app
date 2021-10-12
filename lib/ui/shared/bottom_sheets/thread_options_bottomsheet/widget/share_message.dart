import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/bottom_sheets/thread_options_bottomsheet/thread_option_bottomsheet_viewmodel.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/models/user_post.dart';

class ShareMessage extends StatelessWidget {
  const ShareMessage(this.userPost, {Key? key}) : super(key: key);
  final UserPost? userPost;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadOptionsBottomSheetViewModel>.reactive(
      onModelReady: (model) => model.initialise(userPost!.id!),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const CustomText(
              text: 'Share message', fontWeight: FontWeight.bold),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ], //IconButton
          leading: IconButton(
            onPressed: model.exitPage,
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ),
        body: Container(
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'To:',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Type the name of a channel or person'),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const TextField(
                  decoration:
                      InputDecoration(hintText: 'Add a message if you like'),
                ),
                Container(
                  color: AppColors.greyColor,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.format_bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.format_italic,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.strikethrough_s,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.code,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.link,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.format_list_bulleted,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.format_list_numbered,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.format_line_spacing,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ThreadCardView.detail(userPost),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ThreadOptionsBottomSheetViewModel(),
    );
  }
}
