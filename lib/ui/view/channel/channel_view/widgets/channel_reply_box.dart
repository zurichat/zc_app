import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ChannelReplyBox extends HookViewModelWidget<ChannelPageViewModel> {
  const ChannelReplyBox({Key? key, this.channelId}) : super(key: key);

  final String? channelId;
  @override
  Widget buildViewModelWidget(
      BuildContext context, ChannelPageViewModel model) {
    TextEditingController _messageController = useTextEditingController();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          const   Divider(height: 0, color: Color(0xFF999999)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    margin:const  EdgeInsets.only(left: 13.0),
                    alignment: Alignment.centerLeft,
                    child: FocusScope(
                      child: Focus(
                        onFocusChange: (focus) {
                          if (focus) {
                            model.onMessageFieldTap();
                          } else {
                            model.onMessageFocusChanged();
                          }
                        },
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          maxlines:null,
                          inputAction: TextInputAction.send,
                          expands: true,
                          autoCorrect: false,
                          obscureText: false,
                          isCollapsed: true,
                          textAlignVertical: TextAlignVertical.center,
                        controller: _messageController,
                          hintText: 'Add a Reply',
                           hintStyle: AppTextStyles.faintBodyText,
                             style: GoogleFonts.lato(
          color: const Color(0xFF7B8794),
          fontSize: 16.0,
        ),

                         
                        ),
                        
                        // TextField(
                        //   controller: _messageController,
                        //   expands: true,
                        //   maxLines: null,
                        //   textAlignVertical: TextAlignVertical.center,
                        //   decoration: InputDecoration.collapsed(
                        //       hintText: 'Add a Reply',
                        //       hintStyle: AppTextStyles.faintBodyText),
                        // ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !model.isVisible,
                  child: Row(
                    children:[
                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.darkGreyColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon:const  Icon(
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
                visible: model.isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              AppIcons.shapezap,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              Icons.alternate_email_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              Icons.tag_faces_sharp,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              Icons.attach_file_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          if (_messageController.text.toString().isNotEmpty) {
                            model.sendMessage(
                                _messageController.text, "$channelId");

                            _messageController.text = "";
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        icon:const  Icon(
                          Icons.send,
                          color: AppColors.darkGreyColor,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
