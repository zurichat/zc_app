import 'package:flutter/material.dart';
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
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                    onPressed: model.exitPage,
                    icon: const Icon(Icons.close_rounded)),
                title: const Text('Set a status'),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: AppColors.zuriTextBodyColor),
                    ),
                  )
                ],
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
                            )),
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
                            Text('Clear after...'),
                            Text('Today'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Statuses(
                      title: 'Recent',
                      children: [
                        Status(
                            status: 'Former Status',
                            duration: "Don't clear",
                            icon: Icons.biotech_rounded),
                        Status(
                            status: 'Former Former Status',
                            duration: "Don't clear",
                            icon: Icons.social_distance)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Statuses(
                      title: 'For HNGi8 x I4G',
                      children: [
                        Status(
                            status: 'In a meeting',
                            duration: '1 hour',
                            icon: Icons.calendar_today_rounded),
                        Status(
                            status: 'Commuting',
                            duration: '30 minutes',
                            icon: Icons.train),
                        Status(
                            status: 'Off sick',
                            duration: 'Today',
                            icon: Icons.sick_rounded),
                        Status(
                            status: 'On holiday',
                            duration: "Don't clear",
                            icon: Icons.hotel),
                        Status(
                            status: 'Working remotely',
                            duration: 'Today',
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
