import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/channel/channel_view/question_into_poll/question_into_poll_viewmodel.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../../shared/shared.dart';
import 'question_into_poll_view.form.dart';
import 'package:polls/polls.dart';

@FormView(
  fields: [
    FormTextField(name: 'question'),
    FormTextField(name: 'optionOne'),
    FormTextField(name: 'optionTwo'),
  ],
)
class QuestionIntoPollView extends StatelessWidget with $QuestionIntoPollView {
  final List<UserPost>? channelUserMessages;
  QuestionIntoPollView({
    Key? key,
    this.channelUserMessages,
  }) : super(key: key);

  Map usersWhoVoted = {
    'test@gmail.com': 1,
    'abc@gmail.com': 3,
    'deb@gmail.com': 2,
    'gty@gmail.com': 3,
  };

//this.usersWhoVoted[this.user] = choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionIntoPollViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      //this parameter allows us to reuse the view model to persist the state
      viewModelBuilder: () => QuestionIntoPollViewModel(),
      builder: (context, model, child) {
        final message = model.channelUserMessages;
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: ZuriAppBar(
                leading: Icons.arrow_back_ios,
                whiteBackground: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      model.exitPage();
                    },
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                    ),
                  ),
                  const TextButton(onPressed: null, child: Text('Create Poll')),
                ]),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Polls(
                  children: [
                    // This cannot be less than 2, else will throw an exception
                    Polls.options(title: 'Cairo', value: model.option1),
                    Polls.options(title: 'Mecca', value: model.option2),
                  ],
                  question: const Text('message![index].message'),
                  currentUser: 'gggg',
                  allowCreatorVote: true,
                  creatorID: 'creator',
                  voteData: usersWhoVoted,
                  userChoice: 1,
                  onVoteBackgroundColor: Colors.blue,
                  leadingBackgroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  onVote: model.onVote(model.number),
                )));
      },
    );
  }
}
