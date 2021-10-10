import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'plugin_viewmodel.dart';

class PluginPage extends StatelessWidget {
  const PluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (context, model, child) {
        return const PluginPage2();
      },
    ); //
  }
}

class PluginPage2 extends StatelessWidget {
  const PluginPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZuriAppBar(
        orgTitle: Text(Plugins, style: ZuriTextStyle.organizationNameText()),
        bottomNavBarScreen: true,
        leadingWidth: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MenuItemTile(
              icon: Icons.calendar_today,
              text: Text(
                "Holiday Calendar",
                style: AppTextStyles.faintBodyText.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.calendar_today),
                label: const Text(
                  Calendar,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.today),
                label: const Text(
                  Todo,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(FontAwesomeIcons.chessKnight),
                label: const Text(
                  Chess,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.meeting_room),
                label: const Text(
                  Meeting,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.notifications_none_sharp),
                label: const Text(
                  Board,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(FontAwesomeIcons.music),
                label: const Text(
                  Music,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.donut_small),
                label: const Text(
                  Shifts,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.timer),
                label: const Text(
                  Deadlines,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
