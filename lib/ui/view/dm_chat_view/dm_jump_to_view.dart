import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../general_widgets/custom_channel.dart';
import '../../../general_widgets/custom_channel_stage.dart';
import '../../../general_widgets/custom_user.dart';
import '../../../general_widgets/custom_user_channel.dart';
import 'dm_jump_to_view.form.dart';
import 'dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

@FormView(fields: [FormTextField(name: 'search')])
class DmJumpToView extends StatelessWidget with $DmJumpToView {
  DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      fireOnModelReadyOnce: true,
      onModelReady: (model) {
        // listenToFormUpdated(model);
        model.fetchUsers();
      },
      disposeViewModel: false,
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          itemCount: model.userSearch.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: CustomUserChannel(
                image: 'assets/images/Rectangle 138a.png',
                text: model.userSearch[i].username,
                trailingIcon: Icons.circle,
                iconColor: Color(0xff007952),
              ),
            );
          },
            ),
        ),
      ),
    );
  }
}
