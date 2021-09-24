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
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.URL,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.PHONE,
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.CUSTOM,
        pattern:
            r"^(?:http|https):\/\/[\w\-_]+(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)",
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        type: ParsedType.CUSTOM,
        pattern:
            "(---( )?(`)?spoiler(`)?( )?---)\n\n(.*?)\n( )?(---( )?(`)?spoiler(`)?( )?---)",
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
      pattern: r"\[(@[^:]+):([^\]]+)\]",
      style: AppTextStyles.messageTextButton,
      renderText: ({required pattern, required str}) {
        RegExp customRegExp = RegExp(r"\[(@[^:]+):([^\]]+)\]");
        Match match = customRegExp.firstMatch(str)!;

        return {'display': match[1]!};
      },
      onTap: (profile_id) async {
        final _bottomSheetService = locator<BottomSheetService>();
        var sheetResponse = await _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.user,
          isScrollControlled: true,
        );
      },
    ),
    MatchText(
        pattern: r"\B#+([\w]+)\b",
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
    MatchText(
        pattern: r"lon",
        style: AppTextStyles.messageTextButton,
        onTap: ((_) {})),
  ];
}
