import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/ui/shared/dumb_widgets/dm_tile.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/ui/shared/dumb_widgets/channel_tile.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'jump_to_viewmodel.dart';
import 'jump_to_view.form.dart';

@FormView(fields: [FormTextField(name: 'search')])
class JumpToView extends StatelessWidget with $JumpToView {
  JumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JumpToViewModel>.reactive(
      fireOnModelReadyOnce: true,
      onModelReady: (model) {
        // listenToFormUpdated(model);
        model.fetchUsers();
        model.fetchChannels();
      },
      disposeViewModel: false,
      viewModelBuilder: () => JumpToViewModel(),
      builder: (BuildContext context, JumpToViewModel model, Widget? child) =>
          ScreenUtilInit(
        designSize: const Size(411, 823),
    builder: (context, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25.w, 20.h, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                  width: 361.w,
                  // child: TextField(
                  //   textAlignVertical: TextAlignVertical.center,
                  //   controller: searchController,
                  //   keyboardType: TextInputType.text,
                  //   maxLines: 1,
                  //   cursorColor: AppColors.zuriPrimaryColor,
                  //   onChanged: model.onChanged,
                  //   decoration: InputDecoration(
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  //       borderSide: BorderSide(
                  //           color: AppColors.darkGreyColor,
                  //           width: 0.5.w,
                  //           style: BorderStyle.solid),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  //       borderSide: BorderSide(
                  //           color: AppColors.borderColor,
                  //           width: 0.5.w,
                  //           style: BorderStyle.solid),
                  //     ),
                  //     prefixIcon: IconButton(
                  //       icon: Icon(
                  //         Icons.arrow_back_ios_outlined,
                  //         color: Theme.of(context).textTheme.bodyText1!.color,
                  //       ),
                  //       iconSize: 18.sp,
                  //       onPressed: () => model.navigateBack(),
                  //     ),
                  //     hintText: 'Jump to...',
                  //     hintStyle: AppTextStyles.hintStyle.copyWith(),
                  //   ),
                  // ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        height: 88.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder:
                              (BuildContext context, int index) =>
                              SizedBox(
                                width: 16.h,
                              ),
                          itemBuilder: (context, i) {
                            return InkWell(
                              child: DMTile(
                                text: model.userSearch[i].id!,
                              ),
                              onTap: () {
                                model.navigateToUserDm(
                                    model.userSearch[i].id!);
                              },
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: model.userSearch.length,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 16.h,
                        width: 37.w,
                        child: Text(Recent,
                            style: AppTextStyle.whiteSize16
                                .copyWith(fontSize: 12.sp)),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 25.w, 0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder:
                              (BuildContext context, int index) =>
                              SizedBox(height: 24.h),
                          itemBuilder: (context, i) {
                            final channel = model.allChannelsSearch[i];
                            return InkWell(
                              child: ChannelTile(
                                public: channel.isPublic,
                                text: channel.name ?? ChannelName,
                              ),
                              onTap: () {
                                model.navigateToChannel(
                                    name: channel.name,
                                    id: channel.id,
                                    membersCount: channel.membersCount,
                                    isPublic: channel.isPublic);
                              },
                            );
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: model.allChannelsSearch.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
      ),
    );

  }
}
