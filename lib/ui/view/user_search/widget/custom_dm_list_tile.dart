import 'package:flutter/material.dart';
import 'package:zurichat/ui/view/user_search/user_search_viewmodel.dart';
import 'package:stacked/stacked.dart';

<<<<<<< HEAD:lib/ui/home/widgets/custom_dm_list_tile.dart
import '../../view/direct_message/direct_message.dart';

class CustomDMListTile extends StatelessWidget {
=======
class CustomDMListTile extends ViewModelWidget<UserSearchViewModel> {
>>>>>>> e0ec9a58844dcdf0ed41ee76378015bdd3d4baf0:lib/ui/view/user_search/widget/custom_dm_list_tile.dart
  final String? imagelink;
  final String? userName;
  const CustomDMListTile({
    Key? key,
    this.imagelink,
    this.userName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, UserSearchViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.navigateToDirectMessage(userName),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("$imagelink"),
            radius: 20.0,
          ),
          const SizedBox(width: 8),
          TextButton(
<<<<<<< HEAD:lib/ui/home/widgets/custom_dm_list_tile.dart
            //TODO fix this
            onPressed: () {},
=======
            onPressed: viewModel.viewProfile,
>>>>>>> e0ec9a58844dcdf0ed41ee76378015bdd3d4baf0:lib/ui/view/user_search/widget/custom_dm_list_tile.dart
            child: Text(
              "$userName",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
