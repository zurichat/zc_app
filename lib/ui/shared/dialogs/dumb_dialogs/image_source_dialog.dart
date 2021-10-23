import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ImageSourceDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ImageSourceDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              onTap: () => completer(DialogResponse(confirmed: true)),
              leading: const Icon(Icons.camera),
              title: const Text(
                'Take Photo',
              ),
            ),
            // const SizedBox(height: 5),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              onTap: () => completer(DialogResponse(confirmed: false)),
              leading: const Icon(Icons.photo),
              title: const Text(
                'Choose photo from gallery',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
