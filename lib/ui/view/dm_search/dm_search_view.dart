// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/view/dm_search/dm_search_widgets.dart';
import 'package:stacked/stacked.dart';
import 'dm_search_viewmodel.dart';

class DmSearch extends StatefulWidget {
  const DmSearch({Key? key}) : super(key: key);

  @override
  _DmSearchState createState() => _DmSearchState();
}

class _DmSearchState extends State<DmSearch> {
  TextEditingController searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmSearchViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => DmSearchViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 31.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(DM,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(Done,
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: TextField(
                      controller: searchCon,
                      decoration: InputDecoration(
                        hintText: DMHint,
                        hintStyle: GoogleFonts.lato(
                          color: Color(0xFF999999),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Divider(),
                  ChannelorPerson(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
