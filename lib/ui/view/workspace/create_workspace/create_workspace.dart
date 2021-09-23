import 'package:flutter/material.dart';
import 'package:hng/ui/view/workspace/create_workspace/invite.dart';
import 'package:hng/ui/view/workspace/create_workspace/project.dart';
import 'package:stacked/stacked.dart';

import 'company.dart';
import 'create_workspace_viewmodel.dart';

class CreateWorkSpace extends StatelessWidget {
  //The users email address can be passed in here from the api or database

  const CreateWorkSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkSpaceViewModel>.nonReactive(
      viewModelBuilder: () => CreateWorkSpaceViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/cancel.png'),
          ),
        ),
        body: PageView(
          controller: model.pageController,
          children: [
            CompanyPage(),
            ProjectPage(),
            InvitePage(),
          ],
        ),
      ),
    );
  }
}
