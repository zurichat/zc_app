import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'advanced_viewmodel.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdvancedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriTopBar(
          orgTitle: const Text(Advanced),
          whiteBackground: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MenuItemTile.icon(
                text: const Text(EmojiDeluxe),
                subtitle: EmojiDeluxeSubititle,
                imageIcon: 'assets/icons/emojiHands/${model.currentEmoji}.png',
                onPressed: model.changeSkinTone,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(ShowPreviews),
                subtitle: ShowPreviewsSubtitle,
                onChanged: model.toggleShowImagePreviews,
                value: model.showImagePreviews,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(OpenWebPages),
                subtitle: OpenWebPagesSubtitle,
                value: model.openWebPagesInApp,
                onChanged: model.toggleOpenWebPagesInApp,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(TypingIndicator),
                subtitle: TypingIndicatorSubtitle,
                value: model.displayTypingIndicators,
                onChanged: model.toggleDisplayTypingIndicators,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(AnimateEmoji),
                subtitle: AnimateEmojiSubtitle,
                value: model.allowAnimatedImageAndEmoji,
                onChanged: model.toggleAllowAnimatedImageAndEmoji,
              ),
              MenuItemTile.flipSwitch(
                  text: const Text(OptimiseImage),
                  subtitle: OptimiseImageSubtitle,
                  value: model.optimizeImageUploads,
                  onChanged: model.toggleOptimizeImageUploads),
              const MenuItemTile(
                text: Text(
                  ResetCache,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const MenuItemTile(
                text: Text(
                  ForceStop,
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: UnsavedDataWarning,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AdvancedViewModel(),
    );
  }
}
