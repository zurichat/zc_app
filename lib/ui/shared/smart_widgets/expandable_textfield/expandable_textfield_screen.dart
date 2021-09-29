import 'package:flutter/material.dart';
import 'package:hng/general_widgets/expandable_textfield.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ExpandableTextFieldScreen extends StatelessWidget {
  const ExpandableTextFieldScreen(
      {Key? key, required this.widget, required this.sendMessage})
      : super(key: key);
  final Widget widget;
  final Function(String message) sendMessage;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpandableTextFieldScreenViewModel>.reactive(
      viewModelBuilder: () => ExpandableTextFieldScreenViewModel(),
      builder: (__, model, _) {
        if (model.isExpanded) {
          return ExpandableTextField(
            controller: model.textController,
            isExpanded: model.isExpanded,
            isVisible: model.isVisible,
            sendMessage: () {
              sendMessage(model.textController.text);
              model.textController.clear();
              model.toggleExpanded();
              // model.toggleExpanded();
            },
            toggleExpanded: model.toggleExpanded,
            toggleVisibility: (val) => model.toggleVisibility(val),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  controller: model.scrollController,
                  child: widget,
                ),
              ),
              ExpandableTextField(
                controller: model.textController,
                isExpanded: model.isExpanded,
                isVisible: model.isVisible,
                sendMessage: () => sendMessage(model.textController.text),
                toggleExpanded: model.toggleExpanded,
                toggleVisibility: model.toggleVisibility,
              ),
            ],
          );
        }
      },
    );
  }
}

  
// Column(
//                           children: [
//                             ChannelIntro(
//                               channelName: channelname,
//                             ),
//                             ChannelChat(
//                               channelId: channelId,
//                             ),
//                           ],
//                         ),
                      // )