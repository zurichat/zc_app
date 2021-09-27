import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../general_widgets/custom_text.dart';
import '../../../shared/colors.dart';
import '../../../shared/shared.dart';
import 'threads_viewmodel.dart';
import 'widgets/thread_card.dart';

class ThreadsView extends StatelessWidget {
  const ThreadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Threads',
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: model.exitPage,
          ),
          elevation: 1,
        ),
        body: RefreshIndicator(
          color: AppColors.zuriPrimaryColor,
          onRefresh: model.refreshThreadsPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'No new replies',
                    style: AppTextStyles.body2Bold,
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.userPosts.length,
                    itemBuilder: (ctx, index) {
                      return ThreadCard(model.userPosts[index]);
                    }),
              ],
            ),
          ),
        ),
      ),
      onModelReady: (viewModel) => viewModel.initialise(),
      viewModelBuilder: () => ThreadsViewModel(),
    );
  }
}