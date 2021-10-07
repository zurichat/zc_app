import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'saved_items_viewmodel.dart';
import 'widgets/saved_item_background.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      onModelReady: (model) => model.savedItems,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          whiteBackground: true,
          leadingPress: () => model.exitPage(),
          orgTitle: Text('Saved Items', style: AppTextStyles.heading4),
        ),
        body: model.savedBuilderList.isEmpty
            ? const SavedItemBackground()
            : ListView.separated(
                itemCount: model.savedBuilderList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.savedBuilderList[index].channelName!,
                            style: AppTextStyles.heading4),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  model.savedBuilderList[index].userImage!),
                            ),
                            const SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      model.savedBuilderList[index]
                                              .displayName ??
                                          model.savedBuilderList[index].userID!,
                                      style: AppTextStyles.heading7),
                                  const SizedBox(height: 10),
                                  Text(model.savedBuilderList[index].message!)
                                ]),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 25),
                    height: 15,
                    width: double.infinity,
                    color: AppColors.greyishColor.withOpacity(0.15),
                  );
                },
              ),
      ),
      viewModelBuilder: () => SavedItemsViewModel(),
    );
  }
}

