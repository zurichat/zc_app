import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked_services/stacked_services.dart';

class ShowAlertDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ShowAlertDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _ShowAlertDialogContent(request: request, completer: completer));
  }
}

class _ShowAlertDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const _ShowAlertDialogContent(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          padding:
              const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                request.title ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              UIHelper.verticalSpaceSmall,
              const Divider(
                thickness: 1.5,
              ),
              UIHelper.verticalSpaceSmall,
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text(
                          '${request.secondaryButtonTitle!}',
                          style: const TextStyle(
                            color: AppColors.appBarGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                    const VerticalDivider(
                      thickness: 1.5,
                    ),
                    TextButton(
                        onPressed: () =>
                            completer(DialogResponse(confirmed: true)),
                        child: Text(
                          '${request.mainButtonTitle ?? ''}',
                          style: const TextStyle(
                            color: AppColors.appBarGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
