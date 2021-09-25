import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_appbar.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_row.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

import 'channel_page_view.form.dart';
import 'channel_page_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'editor'),
  ],
)
class ChannelPageView extends StatelessWidget with $ChannelPageView {
  ChannelPageView({
    Key? key,
    required this.channelname,
    required this.channelId,
    required this.membersCount,
    required this.public,
  }) : super(key: key);
  static String name = "general";
  final String? channelname;
  final String? channelId;
  final int? membersCount;
  final bool? public;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    TextEditingController _messageController = TextEditingController();
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      onModelReady: (model) {
        model.fetchMessages("$channelId");

        model.websocketConnect();
      },
      //this parameter allows us to reuse the view model to persist the state
      //disposeViewModel: false,
      //initialise the view model only once
      //initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBars(
            channelName: "#$channelname",
            numberOfMembers: '$membersCount',
            model: viewModel,
          ),
          body: Column(
            children: [
              channelName("#$channelname"),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: channelInfo('@mark',
                    ' created this channel on August 12, 2021. This is the very beginning of the #$name channel.'),
              ),
              const SizedBox(height: 20),
              CustomRow(model: viewModel),
              const SizedBox(height: 20),
              dateBuilder(context),
              const SizedBox(height: 7),
              Expanded(
                child: !nullListChecker(viewModel.channelUserMessages)
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: viewModel.channelUserMessages!.length,
                        itemBuilder: (context, index) =>
                            ThreadCardView.threadChannelMain(
                                viewModel.channelUserMessages![index]),
                      )
                    : Container(),
              ),
              //message starts here
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(height: 0, color: Color(0xFF999999)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 56,
                              margin: EdgeInsets.only(left: 13.0),
                              alignment: Alignment.centerLeft,
                              child: FocusScope(
                                child: Focus(
                                  onFocusChange: (focus) {
                                    if (focus) {
                                      viewModel.onMessageFieldTap();
                                    } else {
                                      viewModel.onMessageFocusChanged();
                                    }
                                  },
                                  child: TextField(
                                    controller: _messageController,
                                    expands: true,
                                    maxLines: null,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Add a Reply',
                                        hintStyle: AppTextStyles.faintBodyText),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !viewModel.isVisible,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.attach_file_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Visibility(
                          visible: viewModel.isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        AppIcons.shapezap,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.alternate_email_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.tag_faces_sharp,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.attach_file_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_messageController.text
                                        .toString()
                                        .isNotEmpty) {
                                      viewModel.sendMessage(
                                          _messageController.text,
                                          "$channelId");

                                      _messageController.text = "";
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: AppColors.darkGreyColor,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              )
              // ListTile(
              //   leading: Image.asset('assets/channel_page/female.png'),
              //   title: Row(
              //     children: [
              //       Text(
              //         'Clutch',
              //         style: AppTextStyles.nameStyle,
              //       ),
              //       const SizedBox(width: 10),
              //       Text(
              //         '12:30pm',
              //         style: AppTextStyles.smallText,
              //       ),
              //     ],
              //   ),
              //   subtitle: Text('Joined #$name'),
              // ),
              // ListTile(
              //   leading: Image.asset('assets/channel_page/femaleuser.png'),
              //   title: Row(
              //     children: [
              //       Text(
              //         'Ali',
              //         style: AppTextStyles.nameStyle,
              //       ),
              //       const SizedBox(width: 10),
              //       Text(
              //         '12:30pm',
              //         style: AppTextStyles.smallText,
              //       ),
              //     ],
              //   ),
              //   subtitle: Text('Joined #$name'),
              // ),
            ],
          ),
          //  bottomSheet: sendMessageArea(name, editorController),
        );
      },
    );
  }
}

Padding channelName(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 80),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.header6,
        )
      ],
    ),
  );
}

Container channelInfo(String text, String nexttext) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 1.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.clip,
              text: TextSpan(
                text: text,
                style: AppTextStyles.bodySmall,
                children: <TextSpan>[
                  TextSpan(
                    text: nexttext,
                    style: AppTextStyles.body1Grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

sendMessageArea(name, editorController) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editorController,
            decoration: InputDecoration.collapsed(
              hintText: 'Message #${ChannelPageView.name}',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.ZuriGrey,
              ),
            ),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        const ImageIcon(AssetImage('assets/channel_page/light.png')),
        const SizedBox(width: 22),
        const Icon(CupertinoIcons.camera),
        const SizedBox(width: 22),
        const ImageIcon(AssetImage('assets/channel_page/attach.png')),
      ],
    ),
  );
}

dateBuilder(BuildContext context) {
  return Row(children: <Widget>[
    const Expanded(
        child: Divider(
      endIndent: 1,
      color: AppColors.borderColor,
    )),
    Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Container(
        width: 50,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            'today',
            //textAlign: TextAlign.center,
            style: AppTextStyles.smallTextGrey,
          ),
        ),
      ),
    ),
    const Expanded(
        child: Divider(
      indent: 1,
      color: AppColors.borderColor,
    )),
  ]);
}
