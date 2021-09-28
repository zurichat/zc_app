import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../utilities/enums.dart';
import '../../../view/dm_user/dm_user_viewmodel.dart';
import '../../colors.dart';

void setupBottomSheetUi2() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const FloatingBoxBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmUserViewModel>.reactive(
      builder: (context, model, child) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.face_outlined),
                      const Icon(Icons.face),
                      const Icon(Icons.face),
                      const Icon(Icons.face),
                    ],
                  )
                ],
              ),
              const Divider(thickness: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.message_rounded),
                    title: const Text('Follow Thread'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mark_as_unread),
                    title: const Text('Mark Unread'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Delete Message'),
                    onTap: () {
                      model.deleteMessage(request!.data);
                      print('Our data ${request!.title}');
                      model.popScreen();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.copy),
                    title: const Text('Copy Text'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message_sharp),
                    title: const Text('Reply In Thread'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions),
                    title: const Text('Share Message'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('Save'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Copy Link to Message'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DmUserViewModel(),
    );
  }
}
