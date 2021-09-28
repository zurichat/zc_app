import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared/colors.dart';
import 'dm_jump_to_view.form.dart';
import 'dm_jump_to_viewmodel.dart';

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
                    body: Padding(
                      padding: EdgeInsets.fromLTRB(25.w, 20.h, 15.w, 0),
                      child: ListView(
                        shrinkWrap: true,
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
                                  icon:
                                      const Icon(Icons.arrow_back_ios_outlined),
                                  iconSize: 18,
                                  onPressed: () => model.navigateBack(),
                                ),
                                // isCollapsed: true,
                                contentPadding: const EdgeInsets.only(
                                  top: 16.0,
                                  left: 8,
                                  right: 8,
                                ),
                                hintText: 'Jump to...',
                                hintStyle: TextStyle(
                                  //TODO change to Brand Colors
                                  color: const Color(0xffA1A9B3),
                                  fontSize: 14.4.sp,
                                  // height: 3.4.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                            height: 95.h,
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
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/images/Rectangle 138a.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      SizedBox(
                                          height: 32.h,
                                          child: Text(
                                            model.userSearch[i].username!,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
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
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 22.h),
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  Text('#',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      )),
                                  SizedBox(width: 21.33.w),
                                  Text(
                                    model.allChannelsSearch[i].name ??
                                        'Channel name',
                                    // style: ZuriTextStyle.mediumBold(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              );
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: model.allChannelsSearch.length,
                          ),
                        ],
                      ),
                    ),
                  )),
    );
  }
}
