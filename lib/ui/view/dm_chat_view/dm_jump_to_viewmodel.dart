import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_user.dart';
import 'package:stacked/stacked.dart';

class DmJumpToViewModel extends BaseViewModel {

  var index;
  var ListofChannels;
  var ListofDms = [
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'Fierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'Abd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'Souljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'Princess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'Nudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'Unknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'abcFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'deAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'fjSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'hiPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'jkNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'lmUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'noFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'noAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'Souljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'noPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'Nudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'yesUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'itFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'yesAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'itSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'carsPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'carsNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'traUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'traFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'Abd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'traSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'sowPrincesssssssssssssssssss',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'cutNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'youUnknown',
    ),
  ];

  var recentDmsFromApi=[
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'cutNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'youUnknown',
    ),
  ];

   var list=[
     CustomUser(
       image: 'assets/images/Rectangle 1931 (4).png',
       text: 'cutNudis',
     ),
     CustomUser(
       image: 'assets/images/Rectangle 1931 (5).png',
       text: 'youUnknown',
     ),
   ];

  TextEditingController _controller = TextEditingController();

  void _onChanged() => (value){

    if(value.isEmpty){
      list.clear();
      list.addAll(recentDmsFromApi);
    }else {
      list.clear();
      for (index in ListofDms) {
        if (index.text.toLowerCase().contains(value.toLowerCase())) {
          list.add(index);
        }
      }

    }
    notifyListeners();
  };

  TextEditingController get controller => _controller;
  get onChanged => _onChanged();

}