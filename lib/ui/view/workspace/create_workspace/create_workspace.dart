import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'create_workspace_viewmodel.dart';

class CreateWorkSpace extends StatelessWidget {

  //The users email address can be passed in here from the api or database
  final String email = 'Johndoe@gmail.com';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkSpaceViewModel>.nonReactive(
      viewModelBuilder: () => CreateWorkSpaceViewModel(),
      builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        title: Text(
          'Create a workspace',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.deepBlackColor,
          ),
          // style: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w700,
          //   color: Colors.black
          // ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 12,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.black,
        ),
      ),

      body: Container(
        margin: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
        height: 137.0,
        width: 395.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]

        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.5, top: 24),
                  child: Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: AppColors.deepBlackColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.5, top: 24),
                  child: GestureDetector(
                    onTap: () {
                      // Continue with user email
                    },
                    child: Text(
                        model.userEmail,
                      style: TextStyle(
                        color: AppColors.deepBlackColor,
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 57.0, top: 24, bottom: 24),
              child: Divider(thickness: 1, height: 9, color: AppColors.greyishColor,),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.5,),
                  child: Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: AppColors.deepBlackColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.5, ),
                  child: GestureDetector(
                    child: Text(
                   model.anotherEmail,
                      style: TextStyle(
                        color: AppColors.deepBlackColor,
                        fontSize: 14
                      ),

                    ),
                    onTap: () {
                      // Open Use another email screen
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}


