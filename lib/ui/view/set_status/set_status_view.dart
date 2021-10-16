import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/view/set_status/set_status_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/set_status/set_status_view.form.dart';

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
      // onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            'Set a status',
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
                    child: TextField(
                      cursorColor: AppColors.zuriPrimaryColor,
                      decoration: InputDecoration(
                        hintText: model.hintText,
                        border: InputBorder.none,
                      ),
                      onChanged: model.statusValueText,
                    ),
                    fit: FlexFit.loose,
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
              /*const Divider(),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: model.clearAfter,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(ClearAfter),
                      Text(DontClear),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Statuses(
                title: Recent,
                children: [
                  Status(
                      status: FormerStatus,
                      duration: DontClear,
                      icon: Icons.biotech_rounded),
                  Status(
                      status: FormerStatus,
                      duration: DontClear,
                      icon: Icons.social_distance)
                ],
              ),
              const SizedBox(height: 10),
              const Statuses(
                title: TrackDescription,
                children: [
                  Status(
                      status: InMeeting,
                      duration: OneHour,
                      icon: Icons.calendar_today_rounded),
                  Status(
                      status: Commuting,
                      duration: ThirtyMins,
                      icon: Icons.train),
                  Status(
                      status: OffSick,
                      duration: Today,
                      icon: Icons.sick_rounded),
                  Status(
                      status: OnHoliday,
                      duration: DontClear,
                      icon: Icons.hotel),
                  Status(
                      status: WorkingRemotely,
                      duration: Today,
                      icon: Icons.home),
                ],
              ),
            */
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SetStatusViewModel(),
    );
  }
}
