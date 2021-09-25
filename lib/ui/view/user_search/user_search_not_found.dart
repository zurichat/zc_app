import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'user_search_viewmodel.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserSearchViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColors.zuriPrimaryColor,
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
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Column(
                        children: [
                          Text('People'),
                          Text('2552 members'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search for members',
                        hintStyle: GoogleFonts.lato(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('No result found'),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Start new search',
                        style: AppTextStyles.buttonText),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.zuriPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => UserSearchViewModel(),
    );
  }
}
