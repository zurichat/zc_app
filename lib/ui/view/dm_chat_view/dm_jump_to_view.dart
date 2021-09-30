import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/general_widgets/custom_channel.dart';
import 'package:hng/general_widgets/custom_user.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked_annotations.dart';
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
                    body: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 20.h, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 361.w,
                               child: CustomTextField(
                              keyboardType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              autoCorrect: false,
                              obscureText: false,
                              onChanged: model.onChanged,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF7B8794),
                                  width: 0.2,
                                ),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.arrow_back_ios_outlined),
                                iconSize: 18,
                                onPressed: () => model.navigateBack(),
                              ),
                              isCollapsed: true,
                              controller: searchController,
                              hintText: 'Jump to...',
                              hintStyle: TextStyle(
                                //TODO change to Brand Colors
                                color: const Color(0xffA1A9B3),
                                fontSize: 14.4.sp,
                                // height: 3.4.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: const EdgeInsets.only(
                                top: 16.0,
                                left: 8,
                                right: 8,
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
                                        return CustomUser(text: model.userSearch[i].username!,
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
                                        style: AppTextStyles.lastSeen.copyWith(fontSize:12.sp)
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
                                        return CustomChannel(
                                          text: model.allChannelsSearch[i].name ??
                                            'Channel name',
                                          // lock: model.allChannelsSearch[i].private== "True",
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
