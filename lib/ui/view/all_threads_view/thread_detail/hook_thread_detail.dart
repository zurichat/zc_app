import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/model/thread_replies.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/thread_detail_viewmodel.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:stacked/stacked.dart';

class ThreadDetailHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var _messageController = useTextEditingController();
    var _scrollController = useScrollController();
    return ViewModelBuilder<ThreadDetailViewmodel>.reactive(
        viewModelBuilder: () => ThreadDetailViewmodel(),
        builder: (context, viewmodel, child) => Scaffold(
            appBar: AppBar(
              title: CustomText(text: "Threads", fontWeight: FontWeight.bold),
              leading: GestureDetector(
                  onTap: () => viewmodel.pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                  )),
            ),
            body: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(viewmodel.data.threadTitle)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                viewmodel.data.userImageUrl,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      text: viewmodel.data.userName,
                                      fontWeight: FontWeight.bold),
                                  Container(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                          "assets/background/status.png")),
                                  SizedBox(
                                    width: 150,
                                  ),
                                  Icon(Icons.bookmark_border_outlined,
                                      size: 20, color: AppColors.greyishColor),
                                ],
                              ),
                              SizedBox(height: 5),
                              CustomText(
                                  text: viewmodel.data.date,
                                  fontSize: 11,
                                  color: AppColors.faintTextColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(viewmodel.data.message,
                          style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.add_reaction_outlined),
                      onPressed: () {},
                    ),
                    Divider(
                      color: AppColors.borderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: "${viewmodel.replies.length} Replies",
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGreyColor,
                              fontSize: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.forward_outlined,
                                    color: AppColors.greyishColor,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showModalSheet(context);
                                  },
                                  icon: Icon(Icons.more_vert_rounded,
                                      color: AppColors.greyishColor)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Divider(
                        color: AppColors.borderColor,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: viewmodel.replies.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                            viewmodel.replies[index].imageUrl,
                                            fit: BoxFit.cover)),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: viewmodel
                                                  .replies[index].senderName,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            Container(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                    "assets/background/status.png")),
                                            SizedBox(width: 10),
                                            CustomText(
                                              text:
                                                  viewmodel.replies[index].time,
                                              color: AppColors.faintTextColor,
                                              fontSize: 12,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        CustomText(
                                          text:
                                              viewmodel.replies[index].message,
                                          fontSize: 14,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
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
                                            viewmodel.onMessageFieldTap();
                                          } else {
                                            viewmodel.onMessageFocusChanged();
                                          }
                                        },
                                        child: TextField(
                                          controller: _messageController,
                                          expands: true,
                                          maxLines: null,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration.collapsed(
                                              hintText: 'Add a Reply',
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFBEBEBE),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !viewmodel.isVisible,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Color(0xFF424141),
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.attach_file_outlined,
                                          color: Color(0xFF424141),
                                        ),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Visibility(
                                visible: viewmodel.isVisible,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              AppIcons.shapezap,
                                              color: Color(0xFF424141),
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.alternate_email_outlined,
                                              color: Color(0xFF424141),
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.tag_faces_sharp,
                                              color: Color(0xFF424141),
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.camera_alt_outlined,
                                              color: Color(0xFF424141),
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.attach_file_outlined,
                                              color: Color(0xFF424141),
                                            )),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          if (!_messageController.text
                                              .toString()
                                              .isEmpty) {
                                            viewmodel.addReply(
                                                new ThreadReplies(
                                                    imageUrl: viewmodel
                                                        .data.userImageUrl,
                                                    message:
                                                        _messageController.text,
                                                    senderName:
                                                        viewmodel.data.userName,
                                                    time: viewmodel.time()));
                                            _messageController.text = "";
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            _scrollController.jumpTo(
                                                _scrollController
                                                    .position.maxScrollExtent);
                                          }

                                         
                                        },
                                        icon: Icon(
                                          Icons.send,
                                          color: Color(0xFFBEBEBE),
                                        ))
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                  ]),
            )));
  }

  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (context) {
          return Container(
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_rounded,
                            color: AppColors.borderColor),
                        SizedBox(width: 30),
                        CustomText(text: "Remind Me", fontSize: 15)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_border_outlined,
                            color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Add to Saved Items", fontSize: 15)
                      ],
                    ),
                  ),
                  Divider(color: AppColors.borderColor),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.chat, color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Reply in Thread", fontSize: 15)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble_outline,
                            color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Follow Message", fontSize: 15)
                      ],
                    ),
                  ),
                  Divider(color: AppColors.borderColor),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.forward_outlined,
                            color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Share Message", fontSize: 15)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.link_outlined,
                            color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Copy Link to Message", fontSize: 15)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(Icons.copy_rounded, color: AppColors.greyishColor),
                        SizedBox(width: 30),
                        CustomText(text: "Copy Text", fontSize: 15)
                      ],
                    ),
                  ),
                  Divider(color: AppColors.borderColor),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.pin,
                          color: AppColors.greyishColor,
                        ),
                        SizedBox(width: 30),
                        CustomText(text: "Pin to Conversation", fontSize: 15)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
