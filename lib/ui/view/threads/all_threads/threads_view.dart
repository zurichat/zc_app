import 'package:flutter/material.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';

import 'threads_viewmodel.dart';
import 'widgets/thread_card.dart';

class ThreadsView extends StatelessWidget {
  const ThreadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadsViewModel>.reactive(
      builder: (context, model, child) {
        final local = AppLocalization.of(context);
        return Scaffold(
          appBar: ZuriAppBar(
            orgTitle: Text(
              local!.threads,
              style: AppTextStyle.darkGreySize20Bold.copyWith(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
            leading: Icons.chevron_left,
            leadingPress: () => model.exitPage(),
            isDarkMode: Theme.of(context).brightness == Brightness.dark,
            whiteBackground: true,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      local.noNewReplies,
                      style: AppTextStyle.lightGreySize14,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.userPosts.length,
                    itemBuilder: (ctx, index) {
                      return ThreadCard(model.userPosts[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onModelReady: (viewModel) => viewModel.initialise(),
      viewModelBuilder: () => ThreadsViewModel(),
    );
  }
}
