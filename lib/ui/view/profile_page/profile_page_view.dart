/*
  I am a implementing the ability to download profile page picture,
  but as of the time of this writing, 
  the profile page screen have not been built
  so i created this to testing. the dev building the profile screen delete
  but make sure to add model.saveProfilePictureLocally() where he/she see fit
 */
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_page_viewmodel.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
        viewModelBuilder: () => ProfilePageViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: ListView(
                  children: [
                    Column(children: <Widget>[
                      Image.network(model.url),
                      Container(
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.grey)),
                        child: TextButton.icon(
                          onPressed: () {
                            model.saveProfilePictureLocally();
                            final snackBar = SnackBar(
                              content: const Text(
                                'Downloaded',
                              ),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 1000),
                              behavior: SnackBarBehavior.floating,
                              width: 280.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          label: const Text(
                            'download',
                            style: TextStyle(color: Colors.grey),
                          ),
                          icon: const Icon(
                            Icons.download,
                            color: Colors.grey,
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ));
  }
}
