import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'draft_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    // var controller = SlidableController(TickerProvider vsync);
    return ViewModelBuilder<DraftViewModel>.reactive(
      onModelReady: (model) {
        model.drafts;
      },
      builder: (context, model, child) => ScreenUtilInit(
          designSize: const Size(411, 823),
          builder: (context, child) {
            return Scaffold(
              appBar: ZuriAppBar(
                whiteBackground: true,
                leading: Icons.arrow_back_ios,
                leadingWidth: false,
                leadingPress: () {
                  model.goBack();
                },
                orgTitle: Text(
                  local!.draft,
                  style: const TextStyle(color: AppColors.blackColor),
                ),
              ),
              body: model.widgetBuilderList.isNotEmpty
                  ? ListView.separated(
                      itemCount: model.widgetBuilderList.length,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemBuilder: (BuildContext context, int index) {
                        return const Text('Hello');
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 0,
                          color: Colors.black,
                        );
                      })
                  : Padding(
                      padding: EdgeInsets.all(18.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.drafts,
                              size: 47.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Center(
                                child: Text(local.draftMessageIntro,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Center(
                            child: Center(
                              child: Text(local.draftIntroText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.darkGreyColor,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: local.draft,
                child: const Icon(
                  Icons.open_in_new_outlined,
                ),
              ),
            );
          }),
      viewModelBuilder: () => DraftViewModel(),
    );
  }
}
