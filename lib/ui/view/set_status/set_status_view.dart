import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import 'set_status_viewmodel.dart';
import 'widgets/status.dart';
import 'widgets/statuses.dart';

class SetStatusView extends StatelessWidget {
  const SetStatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetStatusViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: ZuriAppBar(
                  leading: Icons.close_rounded,
                  leadingPress: () => model.exitPage,
                  orgTitle: const Text('Set a status'),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        Save,
                        style: TextStyle(color: AppColors.zuriTextBodyColor),
                      ),
                    )
                  ],
                  whiteBackground: true),
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
                            icon:
                                const Icon(Icons.looks_5, color: Colors.blue)),
                        const Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          fit: FlexFit.loose,
                        ),
                        IconButton(
                          onPressed: () {},
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
                            Text(Today),
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
        viewModelBuilder: () => SetStatusViewModel());
  }
}
