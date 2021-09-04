import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class Users {
  String? userName;
  bool? status;
  Users({this.userName, this.status = false});
}

class ChannelorPerson extends StatefulWidget {
  const ChannelorPerson({Key? key}) : super(key: key);

  @override
  _ChannelorPersonState createState() => _ChannelorPersonState();
}

class _ChannelorPersonState extends State<ChannelorPerson> {
  List<Users> names = [
    Users(userName: 'Freshfish', status: true),
    Users(userName: 'Fierce', status: false),
    Users(userName: 'Dee', status: true),
    Users(userName: 'ASAP_A1', status: true),
    Users(userName: 'Happix', status: false),
    Users(userName: 'Kara', status: true),
    Users(userName: 'ChiSarah', status: true),
    Users(userName: 'OyinkanUA', status: false),
    Users(userName: 'damiAaron', status: true),
    Users(userName: 'maxiron', status: true),
    Users(userName: 'ChristieDesign', status: true),
    Users(userName: 'Detective_Khalifah', status: true),
    Users(userName: 'Engr_Jimmy', status: true),
  ];
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return CustomTile(
            userName: names[index].userName,
            isOnline: names[index].status,
          );
        },
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  final String? userName;
  final bool? isOnline;

  const CustomTile({Key? key, this.userName, this.isOnline = false})
      : super(key: key);

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListTile(
        leading: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            // color: Colors.amberAccent,
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1520583457224-aee11bad5112?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(widget.userName!,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                )),
            onlineStatus(isOnline: widget.isOnline!),
          ],
        ),
        trailing: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            }),
      ),
    );
  }
}

Container onlineStatus({bool isOnline = false}) {
  return Container(
    margin: const EdgeInsets.only(left: 17.0),
    width: 8.0,
    height: 8.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: isOnline ? const Color(0xFF007952) : Colors.white,
      border: Border.all(
        color: const Color(0xFF4D4D4D),
        width: 1.5,
      ),
    ),
  );
}
