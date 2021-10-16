import 'package:flutter/material.dart';
import 'package:zurichat/ui/view/user_search/user_search_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomDMListTile extends ViewModelWidget<UserSearchViewModel> {
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
            onPressed: viewModel.viewProfile,
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
