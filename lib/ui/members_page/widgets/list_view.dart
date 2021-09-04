import 'package:flutter/material.dart';

import '../members_page_viewmodel.dart';
import 'list_widget.dart';

class MemberList extends StatefulWidget {
  final List<Map<String, dynamic>> members;
  MemberList(this.members);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  void initState() {
    MembersPageViewModel.foundmembers = MembersPageViewModel.results;
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
                      key: ValueKey(MembersPageViewModel.foundmembers[i]["id"]
                          .toString()),
                      avatarUrl: widget.members[i]['avatarUrl'].toString(),
                      fullName: widget.members[i]['fullName'].toString(),
                      displayName: widget.members[i]['displayName'].toString(),
                      isOnline: widget.members[i]['isOnline'],
                    ))
            : Text(''),
      ),
    );
  }
}
