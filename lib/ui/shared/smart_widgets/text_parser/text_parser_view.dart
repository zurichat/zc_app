import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/text_parser/text_parser_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TextParser extends StatelessWidget {
  const TextParser(this.text, {Key? key}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TextParserViewModel>.reactive(
      builder: (context, model, child) => ParsedText(
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        text: "$text",
        style: AppTextStyles.messageText,
        parse: model.parse,
      ),
      viewModelBuilder: () => TextParserViewModel(),
    );
  }
}
