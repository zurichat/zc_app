import 'package:flutter/material.dart';
class ChannelBrowserContainer extends StatelessWidget {
 final String channelName;
 ChannelBrowserContainer({required this.channelName});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("#",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(channelName,style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20 ),),
                 SizedBox(height: 7),
                  Row(
                    children: <Widget>[
                      Text("You are a member",style:TextStyle(
                        color:  Color(0xff00B87C),
                        fontSize: 14
                      )),
                      SizedBox(width: 5),
                      Icon(Icons.circle,color: Color(0XFFFBEBEBE), size: 10),
                      SizedBox(width: 5),
                      Text("128 members",style: TextStyle(
                        color: Color(0XFFFBEBEBE),
                        fontSize: 15
                      ),)
                    ],
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