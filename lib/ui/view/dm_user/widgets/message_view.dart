import 'package:flutter/material.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/dm_model.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';

class MessageView extends StatelessWidget {
  final DmModel _message;
  const MessageView(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageService = locator<SharedPreferenceLocalStorage>();
    String userName =
        storageService.getString(StorageKeys.displayName).toString();
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(Avatar, width: 40.0, height: 40.0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4.35),
                  Text(
                    _message.createdAt.toString(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                _message.message.toString(),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
