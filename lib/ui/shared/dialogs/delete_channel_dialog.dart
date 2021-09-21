// import 'package:flutter/material.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// class  DeleteChannelDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const  DeleteChannelDialog(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         backgroundColor: Colors.transparent,
//         child: _DeleteChannelDialogContent(request: request, completer: completer));
//   }
// }
//
// class _DeleteChannelDialogContent extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _DeleteChannelDialogContent(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: size.width * .05, vertical: size.height * .02),
//       color: Colors.white,
//       width: size.width * .9,
//       height: size.height * .3,
//       child: Center(child: Text("Hello There"),),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteChannelDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DeleteChannelDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {

      return AlertDialog(
        insetPadding:  EdgeInsets.symmetric(horizontal: 65.0, vertical: 24.0),
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
                Navigator.of(context).pop();
              },
              child: Text('CANCEL')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('DELETE'))
        ],


      );
    });
  }
}


