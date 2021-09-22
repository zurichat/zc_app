import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/shared.dart';

import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'thread_options_bottomsheet_viewmodel.dart';

class ThreadOptionsBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const ThreadOptionsBottomSheetView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ThreadOptionsBottomSheetViewModel>.reactive(
      builder: (context, model, child) => DraggableScrollableSheet(
          maxChildSize: 0.97,
          initialChildSize: 0.7,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: AppColors.whiteColor,
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
                          Icon(Icons.copy_rounded,
                              color: AppColors.greyishColor),
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
          }),
      viewModelBuilder: () => ThreadOptionsBottomSheetViewModel(),
    );
  }
}
