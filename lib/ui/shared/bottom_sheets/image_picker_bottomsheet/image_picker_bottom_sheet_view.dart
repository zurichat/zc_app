import 'package:flutter/material.dart';
import 'package:hng/ui/shared/bottom_sheets/image_picker_bottomsheet/image_picker_bottomsheet_viewmodel.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';
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
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
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
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.zuriDarkGrey.withOpacity(0.6)
                                  : AppColors.whiteColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => completer(SheetResponse(confirmed: true)),
                                title: Center(
                                  child: Text('Photo Library',
                                      style: AppTextStyle.header6),
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                                height: 0,
                              ),
                              ListTile(
                                  onTap: () => completer(SheetResponse(confirmed: false)),
                                  title: Center(
                                    child: Text('Take Photo',
                                        style: AppTextStyle.header6),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? AppColors.zuriDarkGrey.withOpacity(0.6)
                                  : AppColors.whiteColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                              onTap: () {
                                model.dismissBottomSheet();
                              },
                              title: Center(
                                child: Text('Cancel',
                                    style: AppTextStyle.header6),
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
