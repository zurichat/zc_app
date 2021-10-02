import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import '../../shared/colors.dart';
import '../../shared/search_bar.dart';
import 'dm_page_viewmodel.dart';
import 'widgets/dmmessage_unread.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColors.zuriPrimaryColor,
            title: Text(
              DMs,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.whiteColor),
            ),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.zuriPrimaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  JumpToSearchBar(
                      onTap: () => model.navigateToJumpToScreen(),
                      left: 6,
                      right: 6),
                  const SizedBox(height: 30),
                  StreamBuilder<List<DmListItem>>(
                      stream: model.dmListStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.zuriPrimaryColor),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final dm = snapshot.data?[index];
                            return GestureDetector(
                              onTap: () => model.navigateToDmUserView(),
                              child: DMMessageUnread(dm!),
                            );
                          },
                        );
                      }),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => DmPageViewModel(),
    );
  }
}
