import 'package:flutter/material.dart';
import 'package:hng/models/members_model.dart';
import 'package:hng/ui/members_page/members_page_viewmodel.dart';

import 'member_card_widget.dart';



class MemberList extends StatefulWidget {
  final List<MemberModel> members;
  MemberList(this.members);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  void initState() {
   
    MembersPageViewModel.foundmembers = MembersPageViewModel().members;
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MembersPageViewModel.foundmembers.length > 0
            ? ListView.builder(
                itemCount: MembersPageViewModel.foundmembers.length,
                itemBuilder: (ctx, i) => MemberListItem(
                      key: ValueKey(MembersPageViewModel.foundmembers[i].id
                          .toString()),
                      avatarUrl: MembersPageViewModel.foundmembers [i].avatarUrl.toString(),
                      fullName: MembersPageViewModel.foundmembers[i].fullName.toString(),
                      displayName: MembersPageViewModel.foundmembers[i].displayName.toString(),
                      isOnline: MembersPageViewModel.foundmembers[i].isOnline,
                      status:MembersPageViewModel.foundmembers[i].status.toString() ,
                    ))
            : Text('not found'),
      ),
    );
  }
}
