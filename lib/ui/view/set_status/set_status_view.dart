import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/view/set_status/set_status_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/set_status/set_status_view.form.dart';
import 'package:zurichat/ui/view/set_status/widgets/status.dart';
import 'package:zurichat/ui/view/set_status/widgets/statuses.dart';

@FormView(
  fields: [
    FormTextField(name: 'status'),
  ],
)
class SetStatusView extends StatelessWidget with $SetStatusView {
  SetStatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetStatusViewModel>.reactive(
      //TODO: onModelReady to be reviewed in next PR
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            SetAStatus,
            style: AppTextStyle.darkGreySize18Bold.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          actions: [
            TextButton(
              onPressed: model.saveStatus,
              child: Text(
                Save,
                style: AppTextStyle.greenSize16,
              ),
            )
          ],
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          whiteBackground: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              Row(
                children: [
                  InkWell(
                    onTap: model.addEmojiTag,
                    child: model.tagIcon != null
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              model.tagIcon ?? '',
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(bubble),
                          ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextField(
                      cursorColor: AppColors.zuriPrimaryColor,
                      decoration: InputDecoration(
                        hintText: model.hintText,
                        border: InputBorder.none,
                      ),
                      onChanged: model.statusValueText,
                    ),
                  ),
                  IconButton(
                    onPressed: model.clear,
                    icon: const Icon(
                      Icons.cancel,
                      color: AppColors.greyishColor,
                    ),
                  ),
                ],
              ),

              //TODO - Quwaysim
              const Divider(),
              // MaterialButton(
              //   minWidth: double.infinity,
              //   onPressed: model.clearAfter,
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(ClearAfter),
              //         UIHelper.verticalSpaceExtraSmall,
              //         const Text(DontClear),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 10),
              //TODO - Extract TextStyles - During DarkTheme refactor
              Visibility(
                visible: !(model.formerStatusText == null),
                child: Statuses(
                  title: Recent,
                  children: [
                    ListTile(
                      leading: Text(model.formerStatusIcon ?? ''),
                      minLeadingWidth: 20,
                      dense: true,
                      title: RichText(
                        text: TextSpan(
                          text: '${model.formerStatusText ?? ''}',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  ' - ${model.formerStatusDuration ?? 'Don\'t clear'}',
                              style: const TextStyle(
                                color: AppColors.greyishColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    // Status(
                    //     status: FormerStatus,
                    //     duration: DontClear,
                    //     icon: Icons.social_distance)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Statuses(
                title: TrackDescription,
                children: [
                  Status(
                    status: InMeeting,
                    duration: OneHour,
                    icon: Icons.calendar_today_rounded,
                    onPressed: model.inMeeting,
                  ),
                  Status(
                    status: Commuting,
                    duration: ThirtyMins,
                    icon: Icons.train,
                    onPressed: model.commuting,
                  ),
                  Status(
                    status: OffSick,
                    duration: Today,
                    icon: Icons.sick_rounded,
                    onPressed: model.offSick,
                  ),
                  Status(
                    status: OnHoliday,
                    duration: DontClear,
                    icon: Icons.hotel,
                    onPressed: model.onHoliday,
                  ),
                  Status(
                    status: WorkingRemotely,
                    duration: Today,
                    icon: Icons.home,
                    onPressed: model.workingRemotely,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SetStatusViewModel(),
    );
  }
}
