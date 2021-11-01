import 'package:flutter/widgets.dart';

import '../dm_user_viewmodel.dart';
import 'custom_start_message.dart';
import 'online_indicator.dart';

class DMTopBar extends StatelessWidget {
  const DMTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DmUserViewModel();
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 555),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              width: 70,
              height: 70,
              child: Image.asset('assets/images/avatar.png', fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              const OnlineIndicator(0xFF00B87C),
              const SizedBox(width: 16.0),
              Text(model.receiver.username,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8.0),
              Image.asset('assets/images/status.png',
                  width: 16.67, height: 16.0)
            ],
          ),
          const SizedBox(height: 5),
          Text(model.bio,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF3A3A3A))),
          const SizedBox(height: 15),
          StartMessage(model.receiver.username)
        ],
      ),
    );
  }
}
