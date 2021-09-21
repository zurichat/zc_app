import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../general_widgets/custom_channel.dart';
import '../../../general_widgets/custom_channel_stage.dart';
import '../../../general_widgets/custom_user.dart';
import '../../../general_widgets/custom_user_channel.dart';
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
                      padding: EdgeInsets.fromLTRB(25.w, 20.h, 0, 0),
                      child: ListView(
                        children: [
                          TextField(
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
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 88.h,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: CustomUserChannel(
                                    image: 'assets/images/Rectangle 138a.png',
                                    text: model.userSearch[i].username,
                                    trailingIcon: Icons.circle,
                                    iconColor: Color(0xff007952),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: model.userSearch.length,
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
                          Flexible(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 24.h);
                              },
                              itemBuilder: (context, index) {
                                return CustomUserChannel(
                                  image: 'assets/images/Rectangle 138a.png',
                                  text: model.userSearch[index].username,
                                  trailingIcon: Icons.circle,
                                  iconColor: Color(0xff007952),
                                );
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: model.userSearch.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
    );
  }
}
