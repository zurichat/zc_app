import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import 'view_profile_viewmodel.dart';
import 'widgets/profile_action.dart';
import 'widgets/profile_list.dart';

class ViewProfile extends StatelessWidget {
  final bool isActive;

  const ViewProfile({
    Key? key,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewProfileViewModel>.reactive(
      viewModelBuilder: () => ViewProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.8,
            maxChildSize: 1.0,
            builder:
                (BuildContext context, ScrollController scrollController) =>
                    SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/user.png'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          left: 12.0,
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                ),
                              ),
                              Container(
                                //Icon wrapped in container with margin, so long names with stack over/below it
                                margin: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 12.0,
                                  color: isActive
                                      ? AppColors.zuriPrimaryColor
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileAction(
                                title: Text('Message'),
                                onTap: () {},
                              ),
                              ProfileAction(
                                title: Text('Edit Profile'),
                                onTap: () {},
                              ),
                              ProfileAction(
                                title: Icon(Icons.more_horiz),
                                onTap: () {},
                              ),
                            ],
                          ),
                          Divider(),
                          ProfileList(
                            title: 'What I do',
                            description: 'Mobile Development',
                          ),
                          Divider(),
                          ProfileList(
                            title: 'Display Name',
                            description: 'Amanda Josiana',
                          ),
                          Divider(),
                          ProfileList(
                            title: 'Status',
                            description: '4',
                          ),
                          Divider(),
                          ProfileList(
                            title: 'Mobile Number',
                            description: '+23481999444',
                          ),
                          Divider(),
                          ProfileList(
                            title: 'Email Address',
                            description: 'praiseajepe@gmail.com',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
