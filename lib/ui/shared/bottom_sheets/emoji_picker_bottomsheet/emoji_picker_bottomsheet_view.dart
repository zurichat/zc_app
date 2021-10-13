import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'emoji_picker_bottomsheet_viewmodel.dart';

class EmojiPickerBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const EmojiPickerBottomSheetView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<EmojiPickerBottomSheetViewModel>.reactive(
      builder: (context, model, child) => DraggableScrollableSheet(
        maxChildSize: 0.97,
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            padding: const EdgeInsets.only(top: 10),
            height: height * .97,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    height: 5,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greyishColor,
                    ),
                  ),
                  Container(
                    height: height * 0.05,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.01),
                    child: TextField(
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        isCollapsed: true,
                        hintText: 'Search emoji',
                        suffixIcon: const Icon(Icons.mic_none_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.8,
                    margin: EdgeInsets.only(top: height * 0.03),
                    child: Expanded(
                      child: EmojiPicker(
                        onEmojiSelected: (Category category, Emoji emoji) =>
                            completer(
                                SheetResponse(confirmed: true, data: emoji)),
                        config: const Config(
                          columns: 7,
                          emojiSizeMax: 25,
                          initCategory: Category.RECENT,
                          bgColor: Colors.transparent,
                          indicatorColor: AppColors.zuriPrimaryColor,
                          iconColor: AppColors.greyColor,
                          iconColorSelected: AppColors.zuriPrimaryColor,
                          progressIndicatorColor: AppColors.zuriPrimaryColor,
                          backspaceColor: AppColors.zuriPrimaryColor,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          noRecentsText: 'No Recents',
                          noRecentsStyle:
                              TextStyle(fontSize: 20, color: Colors.black26),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      viewModelBuilder: () => EmojiPickerBottomSheetViewModel(),
    );
  }
}
