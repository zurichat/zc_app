import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hng/constants/app_strings.dart';

class SingleListItem {
  final String name;
  final String time;
  final String description;

  SingleListItem(
      {required this.name, required this.time, required this.description});
}

List<SingleListItem> dummyData = [
  SingleListItem(
    name: 'Ali ',
    time: '12:30pm, today',
    description: 'Read the description',
  ),
];

class PinnedMessages extends StatelessWidget {
  const PinnedMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff333333),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text(
          PinnedMsgs,
          style: TextStyle(
              color: Color(0xff242424),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return _listTile();
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(5.0),
                );
              },
              itemCount: 2),
        ),
      ),
    );
  }
}

Widget _listTile() {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: dummyData.length,
        itemBuilder: (context, position) =>
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              ListTile(
                leading: IconButton(
                  icon: Image.asset('assets/images/vector.png'),
                  onPressed: () {},
                ),
                title: Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: dummyData[position].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff242424))),
                        TextSpan(
                            text: dummyData[position].time,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff999999))),
                        TextSpan(
                            text: dummyData[position].description,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff424141))),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Divider(),
              )
            ])),
  );
}
