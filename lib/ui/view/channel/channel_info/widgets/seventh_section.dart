import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../../../utilities/constants/colors.dart';
import '../../../../shared/shared.dart';

import '../channel_info_view_model.dart';

class SeventhSection extends ViewModelWidget<ChannelInfoViewModel> {
  const SeventhSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ChannelInfoViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkThemePrimaryColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).textTheme.bodyText1!.color,
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
                  onPressed: viewModel.showDialog,
                  child: Text(
                    DeleteChannel,
                    style: AppTextStyle.darkGreySize20Bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 45, bottom: 10),
            child: Text(
              DeleteChannelWarning,
              style: AppTextStyle.lightGreySize14,
            ),
          ),
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
//                       viewModels.showDialog();
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
