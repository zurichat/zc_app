import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked_annotations.dart';
import 'dm_jump_to_view.form.dart';
import 'dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

@FormView(fields: [FormTextField(name: 'search')])
class DmJumpToView extends StatelessWidget with $DmJumpToView {
  DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      fireOnModelReadyOnce: true,
      onModelReady: (model) {
        // listenToFormUpdated(model);
        model.fetchUsers();
        model.fetchChannels();
      },
      disposeViewModel: false,
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          ScreenUtilInit(
              designSize: const Size(411, 823),
              builder: () => Scaffold(
                    backgroundColor: Colors.white,
                    resizeToAvoidBottomInset: false,
                    body: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 20.h, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 361.w,
                              child: TextField(
                                controller: searchController,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: model.onChanged,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor,
                                        width: 0.5.w,
                                        style: BorderStyle.solid),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    borderSide: BorderSide(
                                        color: AppColors.borderColor,
                                        width: 0.5.w,
                                        style: BorderStyle.solid),
                                  ),
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.arrow_back_ios_outlined),
                                    iconSize: 18,
                                    onPressed: () => model.navigateBack(),
                                  ),
                                  hintText: 'Jump to...',
                                  hintStyle: AppTextStyles.hintStyle.copyWith(height: 3)
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                physics: BouncingScrollPhysics(),
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
                                          (BuildContext context, int index) => SizedBox(
                                        width: 16.h,
                                      ),
                                      itemBuilder: (context, i) {
                                        return SizedBox(
                                          width: 48.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            // mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8.r),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      dummyUserImage,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Container(
                                                  height: 32.h,
                                                  child: Text(
                                                      model.userSearch[i].username!,
                                                      textAlign: TextAlign.center,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppTextStyles.subtitle1
                                                    // overflow: TextOverflow.fade,
                                                  )),
                                            ],
                                          ),
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
                                    child: Text(
                                        'Recent',
                                        style: AppTextStyles.lastSeen
                                    ),
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
                                        return Row(
                                          children: [
                                            Text('#',
                                                style: AppTextStyles.hashtag),
                                            SizedBox(width: 21.33.w),
                                            Text(
                                                model.allChannelsSearch[i].name ??
                                                    '...',
                                                // style: ZuriTextStyle.mediumBold(),
                                                style: AppTextStyles.nameStyle1
                                            ),
                                          ],
                                        );
                                      },
                                      scrollDirection: Axis.vertical,
                                      itemCount: model.allChannelsSearch.length,
                                    ),
                                  ),
                                ],
                              )

                            )

                          ],
                        ),
                      ),
                    ),
                  )),
    );
  }
}
