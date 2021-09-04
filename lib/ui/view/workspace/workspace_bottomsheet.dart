import 'dart:ui';

import 'package:flutter/material.dart';

class WorkSpaceBottomSheet extends StatelessWidget {

  final String name;
  final String message;
  final String avatarUrl;

  const WorkSpaceBottomSheet({Key? key, this.name ='', this.avatarUrl='', this.message=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Image.asset(this.avatarUrl)),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.name, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                      SizedBox(height: 10),
                      Text(this.message, style: TextStyle(
                          color: Colors.grey
                      ),),
                    ],
                  )
                ],
              ),

            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.person_add, color: Colors.black54,
                ),
                SizedBox(width: 20),
                Text('Invite Members', style:
                TextStyle(
                    fontSize: 14
                ),)
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.logout, color: Colors.red,
                ),
                SizedBox(width: 20),
                Text('Sign Out', style: TextStyle(color: Colors.red),)
              ],
            )
          ],
        ),
      ),
    );
  }
}