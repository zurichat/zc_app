import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_organization_viewmodel.dart';
import 'company.dart';
import 'invite.dart';
import 'project.dart';

class CreateOrganization extends StatelessWidget {
  //The users email address can be passed in here from the api or database

  const CreateOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateOrganizationViewModel>.nonReactive(
      viewModelBuilder: () => CreateOrganizationViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/icons/cancel.png'),
          ),
        ),
        body: PageView(
          controller: model.pageController,
          children: [
            CompanyPage(),
            ProjectPage(),
            InvitePage(),
          ],
        ),
      ),
    );
  }
}


// class CreateOrganization extends StatelessWidget {
//   final OrganizationSwitchMethod method;
//   //The users email address can be passed in here from the api or database

//   const CreateOrganization({Key? key, required this.method}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<CreateOrganizationViewModel>.nonReactive(
//         viewModelBuilder: () => CreateOrganizationViewModel(),
//         builder: (context, model, child) => Scaffold(
//               appBar: AppBar(
//                 title: Text(
//                   'Create an Organization',
//                   style: AppTextStyles.heading9,
//                 ),
//                 backgroundColor: AppColors.whiteColor,
//                 leading: IconButton(
//                   iconSize: 12,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back_ios_outlined),
//                   color: AppColors.blackColor,
//                 ),
//               ),
//               body: GestureDetector(
//                 onTap: () => FocusScope.of(context).unfocus(),
//                 child: Column(children: [
//                   SizedBox(height: 16),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(3),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 8,
//                               offset: Offset(0, 2),
//                             ),
//                           ]),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             left: 8.0, top: 8.0, bottom: 8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 model.onEmailTap(method);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.email_outlined,
//                                       size: 20,
//                                       color: AppColors.deepBlackColor,
//                                     ),
//                                     SizedBox(width: 16),
//                                     Text(
//                                       model.userEmail ?? '',
//                                       style: TextStyle(
//                                           color: AppColors.deepBlackColor,
//                                           fontSize: 14),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 SizedBox(width: 32),
//                                 Expanded(
//                                   child: Divider(
//                                     color: AppColors.dividerColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 model.onEmailTap(method);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.email_outlined,
//                                       size: 20,
//                                       color: AppColors.deepBlackColor,
//                                     ),
//                                     SizedBox(width: 16),
//                                     Text(
//                                       model.anotherEmail,
//                                       style: TextStyle(
//                                           color: AppColors.deepBlackColor,
//                                           fontSize: 14),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ));
//   }
// }
