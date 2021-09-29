// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
// import 'package:stacked/stacked.dart';

// import '../../shared.dart';
// import 'expandable_textfield_viewmodel.dart';

// class ExpandableTextField extends StatelessWidget {
//   const ExpandableTextField({Key? key}) : super(key: key);
//   final bool isExpanded;

//   final String? channelId;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _messageController = useTextEditingController();

//     return ViewModelBuilder<ExpandableTextFieldViewModel>.reactive(
//       viewModelBuilder: () => ExpandableTextFieldViewModel(),
//       builder: (__, model, _) {
//         return Container(
//           height: model.isExpanded
//               ? MediaQuery.of(context).size.height - kToolbarHeight
//               : null,
//           alignment: Alignment.bottomCenter,
//           color: Colors.white,
//           child: Column(
//             mainAxisSize:
//                 model.isExpanded ? MainAxisSize.max : MainAxisSize.min,
//             children: [
//               Divider(height: 0, color: Color(0xFF999999)),
//               Container(
//                 alignment: Alignment.topRight,
//                 child: Visibility(
//                   visible: model.isExpanded,
//                   child: IconButton(
//                     onPressed: () => model.toggleExpanded(),
//                     icon: Icon(
//                       Icons.zoom_out_map,
//                       color: AppColors.darkGreyColor,
//                     ),
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: model.isExpanded,
//                 child: Expanded(
//                   child: _buildTextField(model, _messageController),
//                 ),
//                 replacement: Container(
//                   height: 56,
//                   child: _buildTextField(model, _messageController),
//                 ),
//               ),
//               Visibility(
//                 visible: model.isVisible,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           AppIcons.shapezap,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.alternate_email_outlined,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.tag_faces_sharp,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.camera_alt_outlined,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.attach_file_outlined,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       ),
//                       IconButton(
//                         // TODO: here
//                         onPressed: () {
//                           if (_messageController.text.toString().isNotEmpty) {
//                             model.sendMessage(
//                                 _messageController.text, "$channelId");
//                             _messageController.text = "";
//                             FocusScope.of(context).requestFocus(FocusNode());
//                           }
//                         },
//                         icon: Icon(
//                           Icons.send,
//                           color: AppColors.darkGreyColor,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Focus _buildTextField(ExpandableTextFieldViewModel model,
//       TextEditingController _messageController) {
//     return Focus(
//       onFocusChange: (focus) {
//         if (focus) {
//           model.onMessageFieldTap();
//         } else {
//           model.onMessageFocusChanged();
//         }
//       },
//       child: Row(
//         crossAxisAlignment: model.isExpanded
//             ? CrossAxisAlignment.start
//             : CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               expands: true,
//               maxLines: null,
//               minLines: null,
//               textAlignVertical: model.isExpanded
//                   ? TextAlignVertical.top
//                   : TextAlignVertical.center,
//               decoration: InputDecoration.collapsed(
//                 hintText: 'Add a Reply',
//                 hintStyle: AppTextStyles.faintBodyText,
//               ).copyWith(contentPadding: EdgeInsets.all(10)),
//             ),
//           ),
//           Visibility(
//             visible: !model.isExpanded && model.isVisible,
//             child: IconButton(
//               onPressed: () => model.toggleExpanded(),
//               icon: Icon(
//                 Icons.zoom_out_map,
//                 color: AppColors.darkGreyColor,
//               ),
//               padding: EdgeInsets.all(2),
//             ),
//           ),
//           Visibility(
//             visible: !model.isVisible,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     Icons.camera_alt_outlined,
//                     color: AppColors.darkGreyColor,
//                   ),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.attach_file_outlined,
//                     color: AppColors.darkGreyColor,
//                   ),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
