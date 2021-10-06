import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/dm_search/dm_search_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'dm_search_viewmodel.dart';
import 'dm_search_view.form.dart';

@FormView(fields: [FormTextField(name: 'search')])
class DmSearch extends StatelessWidget with $DmSearch {
  DmSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmSearchViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => DmSearchViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.chevron_left,
            leadingPress: () => viewModel.navigateBack(),
          ),
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
                          icon: const Icon(Icons.chevron_left),
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
                        const Spacer(),
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
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: DMHint,
                        hintStyle: AppTextStyles.body3Medium,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Divider(),
                  const ChannelorPerson(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
