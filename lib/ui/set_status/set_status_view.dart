import 'package:flutter/material.dart';
import 'package:hng/ui/set_status/set_status_viewmodel.dart';
import 'package:hng/ui/set_status/widgets/custom_divider.dart';
import 'package:hng/ui/set_status/widgets/custom_list_tile.dart';
import 'package:stacked/stacked.dart';



class SetStatusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetStatusViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomListTile(
                leading: Icon(Icons.clear, color: Colors.black54, size: 35,),
                title: Text('Set a status', style: SetStatusViewModel.titleStyle),
                trailing: Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text('Save'))
                    ),
              ),
              CustomDivider(),  
              CustomListTile(
                leading: Image.asset('assets/four.png'),
                title:  Text('Set a status', style: SetStatusViewModel.subTitleStyle),
                trailing: Icon(Icons.cancel_rounded, size: 35),
                ), 
                  CustomDivider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Clear after...', style: SetStatusViewModel.subTitleStyle),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text('Clear after', style: SetStatusViewModel.titleStyle)
                  ],
                ),
              ),
              CustomDivider(),
               Padding(
                padding: EdgeInsets.symmetric( vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                      child: Text('Recent', style: SetStatusViewModel.titleStyle),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Column(
                      children: [
                         CustomListTile(
                          leading: Image.asset('assets/four.png'), 
                          title:  Text('- Don\'t clear', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                          leading: Image.asset('assets/three.png'), 
                          title:  Text('- Don\'t clear', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                          leading: Image.asset('assets/two.png'),
                          title:  Text('- Don\'t clear', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                          leading: Image.asset('assets/one.png'),
                          title:  Text('- Custom', style: SetStatusViewModel.titleStyle),
                          ), 
                      ],
                    )
                  ],
                ),
              ),
              CustomDivider(),
              Padding(
                padding: EdgeInsets.symmetric( vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                      child: Text('For HNGi8 14G', style: SetStatusViewModel.titleStyle),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Column(
                      children: [
                         CustomListTile(
                          leading: Image.asset('assets/calendar.png'), 
                          title:  Text('In a meeting - 1 hour', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                          leading: Image.asset('assets/car.png'), 
                          title:  Text('Commuting - 30 minutes', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                          leading: Image.asset('assets/sick.png'), 
                          title:  Text('Out sick - Today', style: SetStatusViewModel.titleStyle),
                          ), 
                         CustomListTile(
                         leading: Image.asset('assets/vacation.png'), 
                          title:  Text('Vacationing - Don\'t clear', style: SetStatusViewModel.titleStyle),
                          ), 
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
        viewModelBuilder: () => SetStatusViewModel());
  }
}