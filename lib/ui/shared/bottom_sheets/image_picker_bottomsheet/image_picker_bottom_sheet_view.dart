import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/bottom_sheets/image_picker_bottomsheet/image_picker_bottomsheet_viewmodel.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const ImagePickerBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<ImagePickerBottomSheetViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? Container()
          : DraggableScrollableSheet(
              // maxChildSize: 0.29,
              initialChildSize: 0.28,
              minChildSize: 0.28,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: dark
                          ? AppColors.zuriDarkGrey.withOpacity(0)
                          : AppColors.whiteColor.withOpacity(0),
                      borderRadius: BorderRadius.circular(30)),
                  height: height * .97,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () =>
                                    completer(SheetResponse(confirmed: true)),
                                title: Center(
                                  child: Text('Photo Library',
                                      style: !dark
                                          ? AppTextStyle.whiteSize18Bold
                                          : AppTextStyle.darkGreySize20Bold),
                                ),
                              ),
                              const Divider(
                                color: AppColors.blackColor,
                                thickness: 2,
                                height: 0,
                              ),
                              ListTile(
                                  onTap: () => completer(
                                      SheetResponse(confirmed: false)),
                                  title: Center(
                                    child: Text('Take Photo',
                                        style: !dark
                                            ? AppTextStyle.whiteSize20Bold
                                            : AppTextStyle.darkGreySize20Bold),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.unreadMessageColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                              onTap: () {
                                model.dismissBottomSheet();
                              },
                              title: Center(
                                child: Text('Cancel',
                                    style: dark
                                        ? AppTextStyle.whiteSize20Bold
                                        : AppTextStyle.darkGreySize20Bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      viewModelBuilder: () => ImagePickerBottomSheetViewModel(),
    );
  }
}
