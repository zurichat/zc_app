import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../../shared/shared.dart';
import '../../channel_info/widgets/textstyles.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 9,
      ),
      child: Stack(
        children: [
          //online Dot
          // ignore: avoid_unnecessary_containers
          Container(
            child: Positioned(
              top: 5,
              left: 36,
              child: Container(
                height: 4,
                width: 4,
                color: AppColors.greenColor,
              ),
            ),
          ),

          //user Image
          // ignore: sized_box_for_whitespace
          Container(
            height: 40,
            width: 40,
            child: const Positioned(
              top: 19,
              left: 19,
              child: Image(
                image: AssetImage('assets/images/user.png'),
              ),
            ),
          ),

          //userName
          Container(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: ListTile(
                title: Text(
                  'Destiny',
                  style: nameStyle(),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.redColor,
                    )),
              )),
        ],
      ),
    );
  }
}
