// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class MessageView extends StatelessWidget {
//   final Message _message;
//   const MessageView(this._message, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, top: 16),
//       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Image.asset('assets/images/avatar.png', width: 40.0, height: 40.0),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(_message.sender.username,
//                       style: const TextStyle(
//                           fontSize: 16.0, fontWeight: FontWeight.w700)),
//                   const SizedBox(width: 4.35),
//                   Text(
//                     _formatTime(_message.time),
//                     style: const TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 4.0),
//               Text(
//                 _message.message,
//                 style: const TextStyle(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.w400,
//                 ),
//               )
//             ],
//           ),
//         )
//       ]),
//     );
//   }

//   String _formatTime(DateTime time) => DateFormat.Hm().format(time);
// }
