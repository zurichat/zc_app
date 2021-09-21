import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi2() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
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
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              Row(
                children: [
                  Icon(Icons.face_outlined),
                  Icon(Icons.face),
                  Icon(Icons.face),
                  Icon(Icons.face),
                ],
              )
            ],
          ),
          Divider(
            thickness: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.message_rounded),
                title: new Text('Follow Thread'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.mark_as_unread),
                title: new Text('Mark Unread'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.delete),
                title: new Text('Delete Message'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.copy),
                title: new Text('Copy Text'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.message_sharp),
                title: new Text('Reply In Thread'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.directions),
                title: new Text('Share Message'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.bookmark),
                title: new Text('Save'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.link),
                title: new Text('Copy Link to Message'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
