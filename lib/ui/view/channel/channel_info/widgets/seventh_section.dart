import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/styles.dart';
import '../channel_info_view_model.dart';

class SeventhSection extends ViewModelWidget<ChannelInfoViewModel> {
  const SeventhSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ChannelInfoViewModel model) {
  
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 11,
                  top: 19,
                  bottom: 10,
                ),
                child: TextButton(
                  onPressed: model.showDialog,
                  child: Text(
                    'Delete Channel',
                    style: AppTextStyles.heading7,
                  ),
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 45, bottom: 10),
              child: Text(
                'All messages from this channel will be removed from Zuri Chat. Any files uploaded to this channel'
                'would not be removed.',
                style: AppTextStyles.normalGrey,
              )),
        ],
      ),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         alignment: Alignment.center,
//         margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(2),
//             border: Border.all(width: 1.0, color: AppColors.borderColor)),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(
//                     left: 9,
//                     top: 19,
//                   ),
//                   child: const Icon(
//                     Icons.lock_outline,
//                     color: AppColors.deepBlackColor,
//                     size: 28,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                     left: 11,
//                     top: 19,
//                     bottom: 10,
//                   ),
//                   child: TextButton(
//                     onPressed: (){
//                       models.showDialog();
//                     },
//                     child: Text(
//                       'Delete Channel',
//                       style: archiveTextStyle(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.only(left: 45, bottom: 10),
//                 child: const Text(
//                   'All messages from this channel will be removed from Zuri Chat. Any files uploaded to this channel'
//                   'would not be removed.',
//                   style: TextStyle(),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
