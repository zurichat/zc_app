import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import '../../nav_pages/dm_page/dm_page.dart';
import '../../nav_pages/home_page/home_page.dart';
import '../../nav_pages/integrate_page/integrate_page_view.dart';
import '../../nav_pages/you_page/you_page.dart';
import 'home_viewmodel.dart';

///Home view is the holder for all the views
///!Do not edit this directly, edit pages instead
///
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          //passing in the current index from the view model
          // so it can return the right screen

          body: getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.greenColor,
            unselectedItemColor: AppColors.navBarItemColor,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Dm',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Integrate',
                icon: Icon(Icons.integration_instructions),
              ),
              BottomNavigationBarItem(
                label: 'You',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }

  ///Get all the pages and match them to the bottom nav icon
  ///that is clicked this would change the view to the current
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return const DmPage();
      case 2:
        return const IntegratePage();
      case 3:
        return const YouPage();
      default:
        return Container();
    }
  }
}
