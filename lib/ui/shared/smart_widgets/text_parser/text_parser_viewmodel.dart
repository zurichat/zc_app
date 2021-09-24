import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked_services/stacked_services.dart';

class TextParserViewModel extends BaseViewModel {
  final parse = <MatchText>[
    MatchText(
        type: ParsedType.EMAIL,
        style: AppTextStyles.messageTextButton,
        onTap: (url) {
          print("mailto:" + url);
        }),
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyles.messageTextButton,
        onTap: (url) async {
          print(url);
        }),
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyles.messageTextButton,
        onTap: (url) {
          print("tel:" + url);
        }),
    MatchText(
      type: ParsedType.CUSTOM,
      pattern:
          r"^(?:http|https):\/\/[\w\-_]+(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)",
      style: TextStyle(color: Colors.lime),
      onTap: (url) => print(url),
    ),
    MatchText(
        type: ParsedType.CUSTOM,
        pattern:
            "(---( )?(`)?spoiler(`)?( )?---)\n\n(.*?)\n( )?(---( )?(`)?spoiler(`)?( )?---)",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 50,
        ),
        onTap: (url) {
          print("tel:" + url);
        }),
    MatchText(
      pattern: r"\[(@[^:]+):([^\]]+)\]",
      style: AppTextStyles.messageTextButton,

      renderText: ({required pattern, required str}) {
        RegExp customRegExp = RegExp(r"\[(@[^:]+):([^\]]+)\]");
        Match match = customRegExp.firstMatch(str)!;

        print('test test: ${match[1]}');
        // return Container(
        //   padding: EdgeInsets.all(5.0),
        //   color: Colors.amber,
        //   child: Text(match[1]!),
        // );
        //
        return {'display': match[1]!};
      },
      onTap: (url) async {
        print(url);
        final _bottomSheetService = locator<BottomSheetService>();
        var sheetResponse = await _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.user,
          isScrollControlled: true,
        );
      },
      // onLongTap: (url) {
      //   print('long press');
      // },
    ),
    MatchText(
      pattern: r"\B#+([\w]+)\b",
      style: AppTextStyles.messageTextButton,
      onTap: (url) async {
        print(url);
      },
      // onLongTap: (url) {
      //   print('long press');
      // },
    ),
    MatchText(
        pattern: r"lon",
        style: TextStyle(
          color: Colors.pink,
          fontSize: 24,
        ),
        onTap: (url) async {})
  ];
}
