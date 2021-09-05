import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProfilePage extends StatelessWidget {
  final bool isActive;

  const ViewProfilePage({
    Key? key,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(fit: StackFit.expand, children: [
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/profile.jpeg'),
                    ),
                  ]),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 12.0,
                  child: Row(
                    children: [
                      Text(
                        'Amanda Josiana Kee',
                        style: TextStyle(
                            color: Colors.white,
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
                      title: 'Display Name', description: 'Amanda Josiana'),
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
            )
          ],
        ),
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
          margin: EdgeInsets.only(top: 4.0, bottom: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.black54)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: title,
          )),
    );
  }
}


class ProfileList extends StatelessWidget {
  final String title;
  final String description;

  const ProfileList({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            description,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
