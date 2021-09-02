import 'package:flutter/material.dart';
import 'package:hng/utilities/constants/styles.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              // backgroundColor: whiteColor,
              body: model.getViewForIndex(model.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: model.currentIndex,
                onTap: model.setIndex,
                backgroundColor: whiteColor,
                selectedItemColor: greenColor,
                unselectedItemColor: navBarItemColor,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.house),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.comment),
                    label: 'DMs',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.table_chart_outlined),
                    label: 'Integrate',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'You',
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
