import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'members_page_viewmodel.dart';
import 'widgets/list_view.dart';

class MembersPageView extends StatefulWidget {
  const MembersPageView({Key? key}) : super(key: key);

  @override
  _MembersPageViewState createState() => _MembersPageViewState();
}

class _MembersPageViewState extends State<MembersPageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MembersPageViewModel>.reactive(
        viewModelBuilder: () => MembersPageViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.appBarTitle,
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    Text(
                        model.members.length.toString() +
                            ' ' +
                            model.appBarSubTitle,
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                )),
            body: Column(
              children: [
                TextField(
                  onChanged: (value) => model.runFilter(value),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Search for memebers',
                      hintStyle: GoogleFonts.lato(
                          color: Color(0xFF727272),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
                MemberList(model.members),
              ],
            )));
  }
}
