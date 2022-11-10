import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'saved_items_viewmodel.dart';
import 'widgets/saved_item_background.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      onModelReady: (model) => model.savedItems,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            local!.savedItems,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          isDarkMode: dark,
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
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.redColor,
                                    ),
                                    onPressed: () => model.deleteItem(index),
                                    child: Text(local.yes)),
                                TextButton(
                                  child: Text(local.no,
                                      style: AppTextStyle.greenSize14),
                                  onPressed: () => model.goBack(),
                                ),
                              ],
                              content: Text(local.deleteMessagePrompt),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ThreadCardView.threadChannelMain(
                          model.savedBuilderList[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
      ),
      viewModelBuilder: () => SavedItemsViewModel(),
    );
  }
}
