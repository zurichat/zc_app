import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'saved_items_viewmodel.dart';
import 'widgets/saved_item_background.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      onModelReady: (model) => model.savedItems,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            SavedItems,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          isDarkMode: _dark,
          whiteBackground: true,
        ),
        body: model.savedBuilderList.isEmpty
            ? const SavedItemBackground()
            : ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: model.savedBuilderList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        model.navigateToMessage(model.savedBuilderList[index]),
                    onLongPress: () {
                      //TODO: replace with dialog service
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                    child: const Text("Yes"),
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.redColor,
                                    ),
                                    onPressed: () => model.deleteItem(index)),
                                TextButton(
                                  child: Text("No",
                                      style: AppTextStyle.greenSize14),
                                  onPressed: () => model.goBack(),
                                ),
                              ],
                              content: const Text(
                                  "Do you want to delete this message?"),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            model.savedBuilderList[index].channelName ??
                                model.savedBuilderList[index].channelId!,
                            style: AppTextStyle.darkGreySize18Bold,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      model.savedBuilderList[index].userImage!),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 4,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.savedBuilderList[index]
                                                .displayName ??
                                            model.savedBuilderList[index]
                                                .userID!,
                                        style: AppTextStyle.darkGreySize20Bold,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(model
                                          .savedBuilderList[index].message!)
                                    ]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
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
