import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/popup_notification/popup_notification_viewmodel.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';

class PopUpNotificationsView extends StatelessWidget {
  const PopUpNotificationsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PopupNotificationViewModel>.reactive(
      builder:(context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title:Text(model.title),
            backgroundColor: AppColors.greenColor,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Chess Room"),
                              leading: Icon(Icons.games_sharp),
                            ),

                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Meeting Room"),
                              leading: Icon(
                                  Icons.perm_contact_calendar_outlined),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Notice Board"),
                              leading: Icon(
                                  Icons.notifications_paused_rounded),
                            ),

                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Music Room"),
                              leading: Icon(Icons.music_note),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Duty Shift"),
                              leading: Icon(Icons.calendar_today_rounded),
                            ),

                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text("Important Deadlines"),
                              leading: Icon(Icons.timelapse_outlined),
                            ),
                          ],
                        ),
                      )
                  ),

                ],
              ),
            ),


          ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              child:Icon(Icons.add),
              backgroundColor: AppColors.greenColor,
              onPressed: (){

                showSimpleNotification(


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15.0),
                           color:AppColors.whiteColor,
                         ),
                          width: MediaQuery.of(context).size.width,

                          child: Column(

                    children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height:20),
                                    Container(
                                      height:40,
                                      width: 60,
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(model.profileImage, fit: BoxFit.contain,),
                                        ),

                               Padding(
                                 padding: const EdgeInsets.only(left:180, top: 8.0),
                                 child: Container(
                                   height:40,

                                   child: Text(model.notiText,style: TextStyle(color: AppColors.deepBlackColor, fontSize: 12.0, ), ),
                                 ),
                               )
                                           ],
                                  ),
                           ),
                         ),
                            SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 70,
                                    height:70,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.greyishColor,
                                      child: Image.asset(model.profileImage2,
                                        fit:BoxFit.contain,

                                      ),
                                    ),),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(model.notiText2, style: TextStyle(color: AppColors.deepBlackColor, fontSize: 12.0, )
                                        ,),
                                    ),
                                    Container(
                                      child: Text(model.notiText4, style: TextStyle(color: AppColors.deepBlackColor, fontSize: 12.0, ),),

                                    ),
                                  ],
                                ),

                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Text(model.notiText3, style: TextStyle(color: AppColors.deepBlackColor),),

                            ),
                          ),
                        ],
                      ),
                             ],),
                          ),
                      ),

                           );
                    }



            )
        );
      },
        viewModelBuilder: () => PopupNotificationViewModel(),


    );
  }

}
