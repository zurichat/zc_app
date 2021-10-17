import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/colors.dart';

import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'advanced_viewmodel.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<AdvancedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.exitPage(),
          orgTitle: Text(
            local!.advanced,
            style: AppTextStyle.darkGreySize20Bold.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          whiteBackground: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MenuItemTile.icon(
                text: Text(local.emojiDeluxe),
                subtitle: local.emojiDeluxeSubititle,
                imageIcon: 'assets/icons/emojiHands/${model.currentEmoji}.png',
                onPressed: model.changeSkinTone,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.showPreviews),
                subtitle: local.showPreviewsSubtitle,
                onChanged: model.toggleShowImagePreviews,
                value: model.showImagePreviews,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.openWebPages),
                subtitle: local.openWebPagesSubtitle,
                value: model.openWebPagesInApp,
                onChanged: model.toggleOpenWebPagesInApp,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.typingIndicator),
                subtitle: local.typingIndicatorSubtitle,
                value: model.displayTypingIndicators,
                onChanged: model.toggleDisplayTypingIndicators,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.animateEmoji),
                subtitle: local.animateEmojiSubtitle,
                value: model.allowAnimatedImageAndEmoji,
                onChanged: model.toggleAllowAnimatedImageAndEmoji,
              ),
              MenuItemTile.flipSwitch(
                  text: Text(local.optimiseImage),
                  subtitle: local.optimiseImageSubtitle,
                  value: model.optimizeImageUploads,
                  onChanged: model.toggleOptimizeImageUploads),
              const MenuItemTile(
                text: Text(
                  local.resetCache,
                  style: const TextStyle(color: AppColors.redColor),
                ),
              ),
              const SizedBox(height: 10),
              MenuItemTile(
                text: Text(
                  local.forceStop,
                  style: const TextStyle(color: AppColors.redColor),
                ),
                subtitle: local.unsavedDataWarning,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AdvancedViewModel(),
    );
  }
}
