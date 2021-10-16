import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

import '../../text_styles.dart';

//To receive keywords
String keyword = '';

class TextParserViewModel extends BaseViewModel {
// To handle keywords a user would want to get notified about

  final parse = <MatchText>[
    //opens the mail app
    MatchText(
        type: ParsedType.EMAIL,
        style: AppTextStyle.greenSize14,
        onTap: ((url) {
          launcher("mailto:" + url);
        })),
    //Opens a browser when an HTML is clicked
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyle.greenSize14,
        onTap: ((url) async {
          var canBrowse = await canLaunch(url);

          if (canBrowse) {
            launcher(url);
          }
        })),
    //passes a number as intent to a dialer
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyle.greenSize14,
        onTap: ((url) {
          launcher("tel:" + url);
        })),
    //To make a text bold using *...*
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'(?<=\*)(.*)(\*)',
        style: AppTextStyle.errorSize14),

// To call channels using the hashtag
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'\B#+([\w-]+)\b',
        style: AppTextStyle.greenSize14,
        onTap: ((_) {})),
    //To alert user of words set as key words
    MatchText(
        //TODO change keyword to variable set by user
        type: ParsedType.CUSTOM,
        pattern: keyword,
        style: AppTextStyle.greenSize14,
        onTap: ((_) {})),
    //gets '@' mentions
    MatchText(
        type: ParsedType.CUSTOM,
        pattern: r'\B@+([\w]+)\b',
        style: AppTextStyle.greenSize14,
        onTap: ((_) {})),
  ];
}
