import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/view/draft/drafts.dart';
import 'package:stacked/stacked.dart';
import 'draft_viewmodel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = SlidableController();
    return ViewModelBuilder<DraftViewModel>.reactive(
      onModelReady: (model) {
        model.drafts;
      },
      builder: (context, model, child) => ScreenUtilInit(
        designSize: const Size(411, 823),
        builder: () => Scaffold(
          appBar: ZuriAppBar(
            whiteBackground: true,
            leading: Icons.arrow_back_ios,
            leadingWidth: false,
            leadingPress: () {
              model.goBack();
            },
            orgTitle: const Text(
              "Draft",
              style: TextStyle(color: AppColors.blackColor),
            ),
          ),
          body: model.widgetBuilderList.isNotEmpty
              ? ListView.separated(
                  itemCount: model.widgetBuilderList.length,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      controller: controller,
                      closeOnScroll: true,
                      key: Key(model.widgetBuilderList[index].subtitle),
                      dismissal: SlidableDismissal(
                        child: const SlidableDrawerDismissal(),
                        key: Key(model.widgetBuilderList[index].subtitle),
                        closeOnCanceled: true,
                        onWillDismiss: (type) {
                          return model
                              .showDeleteDraftDialog(index)
                              .then((onValue) {
                            controller.activeState!.close();
                          });
                        },
                      ),
                      actionPane: const SlidableDrawerActionPane(),
                      actionExtentRatio: 0.35.sp,
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            model.showDeleteDraftDialog(index);
                          },
                          closeOnTap: true,
                        )
                      ],
                      child: CustomListTile(
                        text: model.widgetBuilderList[index].text,
                        subtitle: model.widgetBuilderList[index].subtitle,
                        route: model.widgetBuilderList[index].route,
                        time: model.widgetBuilderList[index].time,
                        model: model,
                      ),
                    );
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
                            child:
                                Text("Draft messages to send when you're ready",
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
                          child: Text(
                              "Start typing a message anywhere, then find it here. Re-read,"
                              " revise, and send whenever you'd like.",
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
            tooltip: AddDraft,
            child: const Icon(
              Icons.open_in_new_outlined,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => DraftViewModel(),
    );
  }
}
