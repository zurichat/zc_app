import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/nav_pages/you_page/you_page_viewmodel.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/set_status/set_status_viewmodel.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/set_status/widgets/status.dart';
import 'package:hng/ui/view/set_status/widgets/statuses.dart';
import 'package:hng/ui/view/set_status/set_status_view.form.dart';

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
      // onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close_rounded,
            leadingPress: () => model.exitPage(),
            orgTitle: Text(
              'Set a status',
              style: AppTextStyles.heading4.copyWith(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
            actions: [
              TextButton(
                onPressed: model.saveStatus,
                child: Text(
                  Save,
                  style: AppTextStyles.heading8,
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        model.tagIcon,
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      child: TextField(
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
                const Divider(),
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
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SetStatusViewModel(),
    );
  }
}
