import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/colors.dart';
import '../../../general_widgets/custom_channel.dart';
import '../../../general_widgets/custom_channel_stage.dart';
import '../../../general_widgets/custom_user_channel.dart';
import 'dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DmJumpToView extends StatelessWidget {
  const DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      onModelReady: (model) => model.fetchUsers(),
      disposeViewModel: false,
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          ScreenUtilInit(
        designSize: const Size(411, 823),
        builder: () => Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                model.userSearch.isEmpty
                    ? SizedBox()
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25.w, 20.h, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.h,
                          width: 361.w,
                          child: TextField(
                            // controller: model.controller,
                            keyboardType: TextInputType.visiblePassword,
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
                              hintStyle: TextStyle(
                                color: Color(0xffA1A9B3),
                                fontSize: 14.4.sp,
                                height: 3.2.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            physics: BouncingScrollPhysics(),
                            children: [
                              SizedBox(height: 24.h),
                              model.list.isEmpty
                                  ? Container()
                                  : Container(
                                      height: 88.h,
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 16.w,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return model.list[index];
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: model.list.length,
                                      ),
                                    ),
                              SizedBox(height: 16.h),
                              Container(
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
                              CustomChannel(text: 'announcement'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'stage4'),
                              SizedBox(height: 24.h),
                              CustomUserChannel(
                                  image: 'assets/images/Rectangle 138a.png',
                                  text: 'OyinkanUA',
                                  text2: 'Oyin Bolaji',
                                  trailingIcon: Icons.circle_outlined),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'general'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                leadingIcon: Icons.lock_outlined,
                                text: 'design_stage10',
                              ),
                              SizedBox(height: 24.h),
                              CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'Abd_Salam',
                                text2: 'rrrr',
                                trailingIcon: Icons.circle,
                                iconColor: Color(0xff007952),
                              ),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'announcement'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'stage4'),
                              SizedBox(height: 24.h),
                              CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'Blaze',
                                text2: 'rrrr',
                                trailingIcon: Icons.circle,
                                iconColor: Color(0xff007952),
                              ),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'announcement'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'stage4'),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'announcement'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'stage4'),
                              SizedBox(height: 24.h),
                              CustomUserChannel(
                                image: 'assets/images/Rectangle 138a.png',
                                text: 'Blaze',
                                text2: 'rrr',
                                trailingIcon: Icons.circle,
                                iconColor: Color(0xff007952),
                              ),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'announcement'),
                              SizedBox(height: 24.h),
                              CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'stage4'),
                              SizedBox(height: 24.h),
                              CustomChannel(text: 'announcement')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
