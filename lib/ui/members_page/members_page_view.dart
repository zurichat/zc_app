import 'package:flutter/material.dart';
import 'package:hng/ui/widgets/members_listview.dart';
import 'package:stacked/stacked.dart';

import 'members_page_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class MembersPageView extends StatelessWidget {
  const MembersPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MembersPageViewModel>.reactive(
        viewModelBuilder: () => MembersPageViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop()),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Members',
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    Text(model.members.length.toString() + ' ' + 'members',
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                )),
            body: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    onChanged: (value) => model.runFilter(value),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Search for members',
                        hintStyle: GoogleFonts.lato(
                            color: Color(0xFF727272),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                MemberList(model.members),
              ],
            )));
  }
}
