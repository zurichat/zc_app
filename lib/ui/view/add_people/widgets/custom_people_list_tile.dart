import 'package:flutter/material.dart';

// import '../../shared/colors.dart';

class CustomPeopleListTile extends StatefulWidget {
  final String? imagelink;
  final String? userName;
  final bool? isOnline;

  const CustomPeopleListTile({
    Key? key,
    this.imagelink,
    this.userName,
    this.isOnline,
  }) : super(key: key);

  @override
  CustomPeopleListTileState createState() => CustomPeopleListTileState();
}

class CustomPeopleListTileState extends State<CustomPeopleListTile> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.focused,
        MaterialState.hovered,
        MaterialState.pressed,
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return ListTile(
      leading: SizedBox(
        height: 30,
        width: 30,
        child: Image.asset("${widget.imagelink}"),
      ),
      title: Text('${widget.userName}',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xFF333333),
            fontSize: 16,
          )),
      trailing: Checkbox(
        fillColor:
            MaterialStateProperty.resolveWith((states) => getColor(states)),
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    );
  }
}
