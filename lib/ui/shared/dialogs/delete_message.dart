import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteMessageDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DeleteMessageDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          width: size.width * .9,
          height: size.height * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Delete message',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: size.width * .01,
              ),
              Text.rich(
                TextSpan(
                  text: '''
Are you sure you want to delete this message?\nThis cannot be undone.''',
                ),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (request.secondaryButtonTitle != null)
                    MaterialButton(
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text('Cancel')),
                  MaterialButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: Text('Delete')),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
