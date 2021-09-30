import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/general_widgets/expandable_textfield.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ExpandableTextFieldScreen extends HookWidget {
  ExpandableTextFieldScreen({
    Key? key,
    required this.widget,
    required this.sendMessage,
    required this.hintText,
  }) : super(key: key);
  final Widget widget;
  final Function(String message) sendMessage;
  final String hintText;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = useTextEditingController();
    return ViewModelBuilder<ExpandableTextFieldScreenViewModel>.reactive(
      viewModelBuilder: () => ExpandableTextFieldScreenViewModel(),
      builder: (__, model, _) {
        if (model.isExpanded) {
          return Hero(
            tag: 'textfield',
            child: ExpandableTextField(
              focus: focusNode,
              hintText: hintText,
              controller: textController,
              isExpanded: model.isExpanded,
              isVisible: model.isVisible,
              sendMessage: () {
                sendMessage(textController.text);
                textController.clear();
                model.toggleExpanded();
                // model.toggleExpanded();
              },
              toggleExpanded: model.toggleExpanded,
              toggleVisibility: (val) => model.toggleVisibility(val),
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: widget,
              ),
              Hero(
                tag: 'textfield',
                child: ExpandableTextField(
                  focus: focusNode,
                  hintText: hintText,
                  controller: textController,
                  isExpanded: model.isExpanded,
                  isVisible: model.isVisible,
                  sendMessage: () => sendMessage(textController.text),
                  toggleExpanded: model.toggleExpanded,
                  toggleVisibility: model.toggleVisibility,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
