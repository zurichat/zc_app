import 'package:flutter/material.dart';
import '../../../general_widgets/svg_icon.dart';
import '../../nav_pages/dm_page/dm_page.dart';
import '../../nav_pages/you_page/you_page_view.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import '../../nav_pages/home_page/home_page.dart';
import 'nav_bar_viewmodel.dart';

import 'package:stacked/stacked.dart';

import '../../nav_pages/home_page/home_page.dart';

///Home view is the holder for all the views
///!Do not edit this directly, edit pages instead
///
class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavBarViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => NavBarViewModel(),
      onModelReady: (vModel) {
        // vModel.bottomNavList = getBottomIcons();
      },
      builder: (context, vModel, child) {
        return Scaffold(
          //passing in the current index from the view model
          // so it can return the right screen

          body: getViewForIndex(vModel.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.zuriPrimaryColor,
            unselectedItemColor: AppColors.navBarItemColor,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: AppTextStyles.normalText,
            unselectedLabelStyle: AppTextStyles.normalText,
            currentIndex: vModel.currentIndex,
            onTap: vModel.setIndex,
            items: getBottomIcons(),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> getBottomIcons() {
    List<String> name = ['Home', 'Dm', 'You'];
    List<SvgData> icons = [SvgAssets.home, SvgAssets.dm, SvgAssets.you];

    List<BottomNavigationBarItem> bottomNavList = List.generate(3, (i) {
      var item = BottomNavigationBarItem(
        label: name[i],
        icon: SvgIcon(
          svgIcon: icons[i],
        ),
        activeIcon: SvgIcon(
          svgIcon: icons[i],
          color: AppColors.zuriPrimaryColor,
        ),
      );

      return item;
    });

    return bottomNavList;
  }

  // [
  //             BottomNavigationBarItem(
  //               label: 'Home',
  //               icon: Image.asset(
  //                 homeIcon,
  //                 height: 20,
  //               ),
  //             ),
  //             BottomNavigationBarItem(
  //               label: 'Dm',
  //               icon: Image.asset(
  //                 dmIcon,
  //                 height: 20,
  //               ),
  //             ),
  //             BottomNavigationBarItem(
  //               label: 'Integrate',
  //               icon: Image.asset(
  //                 integrateIcon,
  //                 height: 20,
  //               ),
  //             ),
  //             BottomNavigationBarItem(
  //               label: 'You',
  //               icon: Image.asset(youIcon, height: 20),
  //             ),
  //           ],

  ///Get all the pages and match them to the bottom nav icon
  ///that is clicked this would change the view to the current
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return const DmPage();
      // case 2:
      //   return const IntegratePage();
      case 2:
        return const YouPage();
      default:
        return Container();
    }
  }
}
