import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import 'dm_user_viewmodel.dart';
import 'dummy_data/models/message.dart';
import 'icons/zap_icon.dart';
import 'widgets/message_view.dart';

class DmUserView extends StatelessWidget {
  DmUserView({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmUserViewModel>.reactive(
        viewModelBuilder: () => DmUserViewModel(),
        builder: (context, model, child) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                iconSize: 18.0,
                color: AppColors.deepBlackColor,
                onPressed: () {
                  model.popScreen();
                },
              ),
              titleSpacing: 0.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(model.receiver.username,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(width: 12.0),
                      _onlineIndicator(0xFF007952),
                    ],
                  ),
                  const Text(
                    'View Details',
                    style: TextStyle(color: Color(0xFF999999), fontSize: 12.0),
                  )
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  color: const Color(0xFF4D4D4D),
                  onPressed: () {},
                )
              ],
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(height: 0, color: AppColors.greyishColor),
                      Container(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 16.0, top: 555),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset(
                                          'assets/images/avatar.png',
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      _onlineIndicator(0xFF00B87C),
                                      const SizedBox(width: 16.0),
                                      Text(model.receiver.username,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(width: 8.0),
                                      Image.asset('assets/images/status.png',
                                          width: 16.67, height: 16.0)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(model.bio,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF3A3A3A))),
                                  const SizedBox(height: 15),
                                  _startMessage(model.receiver.username)
                                ],
                              ),
                            ),
                            GroupedListView<Message, String>(
                              shrinkWrap: true,
                              elements: model.chatMessages,
                              groupBy: (message) {
                                return message.getRelativeTime();
                              },
                              groupSeparatorBuilder: (value) {
                                return _groupSeparator(value);
                              },
                              itemBuilder: (context, message) {
                                return MessageView(message);
                              },
                              groupComparator: (groupOne, groupTwo) =>
                                  groupOne.compareTo(groupTwo),
                              itemComparator: (itemOne, itemTwo) =>
                                  itemOne.id.compareTo(itemTwo.id),
                            ),
                            const SizedBox(height: 40)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                                        model.onTapMessageField();
                                      } else {
                                        model.onUnfocusMessageField();
                                      }
                                    },
                                    child: TextField(
                                      controller: model.messageController,
                                      expands: true,
                                      maxLines: null,
                                      textAlignVertical:
                                      TextAlignVertical.center,
                                      decoration: InputDecoration.collapsed(
                                          hintText:
                                          'Message ${model.receiver.username}',
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
                              visible: !model.hasClickedMessageField,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        AppIcons.shapezap,
                                        color: Color(0xFF424141),
                                      )),
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/icons/fluent_camera-16-regular.svg",
                                      color: Color(0xFF424141),
                                    ),
                                    //onPressed: () {},
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/icons/Vector.svg",
                                      color: Color(0xFF424141),
                                    ),
                                    //onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Visibility(
                            visible: model.hasClickedMessageField,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      model.sendMessage();
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                      // duration: Duration(milliseconds: 500),
                                      // curve: Curves.fastOutSlowIn);
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
              ],
            ),
          );
        });
  }

  Widget _onlineIndicator(int color) {
    return Icon(
      Icons.circle,
      color: Color(color),
      size: 10,
    );
  }

  Widget _groupSeparator(String value) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                color: Color(0xFF7B8794),
              )),
          Container(
            child: Text(value,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7B8794), width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Expanded(
              child: Divider(
                color: Color(0xFF7B8794),
              )),
        ],
      ),
    );
  }

  Widget _startMessage(String username) {
    return RichText(
      text: TextSpan(
          text: 'This is the very beginning of your '
              'direct message \nhistory with ',
          style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                text: '@$username. ',
                style: TextStyle(color: Color(0xFF8CDEC3))),
            TextSpan(
                text: 'Only the two of you are in \nthis conversation, '
                    'and no one else can join it.')
          ]),
    );
  }
}
