import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'user_profile_viewmodel.dart';

class ViewProfilePage extends StatelessWidget {
  final bool isActive;

  const ViewProfilePage({
    Key? key,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Stack(fit: StackFit.expand, children: [
                  Image.network('https://quantum.esu.edu/insider/wp-content/uploads/2019/04/Zuri-Redmond.jpg')
                ]),
              ),
              Positioned(
                // bottom: 20.0,
                left: 12.0,
                child: Row(
                  children: [
                    Text(
                      'Amanda Josiana Kee',
                      style: TextStyle(
                          color: AppColors.greyishColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0),
                    ),
                    Container(
                      //Icon wrapped in container with margin, so long names with stack over/below it
                      margin: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: isActive ? Colors.green : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileAction(title: Text('Message'), onTap: () {}),
                    ProfileAction(title: Text('Edit Profile'), onTap: () {}),
                    ProfileAction(
                        title: Icon(Icons.more_horiz), onTap: () {}),
                  ],
                ),

                Divider(),
                ProfileList(
                    title: 'What I do', description: 'Mobile Development'),
                Divider(),
                ProfileList(
                    title: 'Display Name', description: 'Mark Unlimited'),
                Divider(),
                ProfileList(
                  title: 'Status',
                  description: '4',
                ),
                Divider(),
                ProfileList(
                  title: 'Mobile Number',
                  description: '+2349063569746',
                ),
                Divider(),
                ProfileList(
                  title: 'Email Address',
                  description: 'sasaleniyano@gmail.com',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class ProfileAction extends StatelessWidget {
  final Function onTap;
  final Widget title;

  const ProfileAction({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
          height: 45.0,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 4.0, bottom: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: AppColors.greyishColor)),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
            child: title,
          )),
    );
  }
}

