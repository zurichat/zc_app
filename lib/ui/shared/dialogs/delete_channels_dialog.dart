import 'package:flutter/material.dart';
import 'package:hng/ui/shared/dialogs/delete_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteChannelDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DeleteChannelDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeleteChannelDialogViewModel>.nonReactive(
      viewModelBuilder: () => DeleteChannelDialogViewModel(),
      builder: (context, vmodel, ch) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 24.0),
          scrollable: true,
          title: Text('Delete Channel'),
          // titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
          content: Text(
            'Are you sure you want to delete this channel, this can’t be undone',
            style: TextStyle(fontSize: 16.0),
          ),
          // contentPadding: EdgeInsets.fromLTRB(24.0, 2.0, 24.0, 24.0),
          actions: [
            TextButton(
                onPressed: () {
                  vmodel.popNavigation();
                },
                child: Text('CANCEL')),
            TextButton(
                onPressed: () {
                  vmodel.deleteChannel();
                },
                child: Text('DELETE'))
          ],
        );
      },
    );
  }
}
