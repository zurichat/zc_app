
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'workspace_viewmodel.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkspaceViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Workspaces',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dummyData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.cyan[700],
                                        image: DecorationImage(
                                            image: AssetImage(
                                                dummyData[i].avatarUrl)),
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                          (dummyData[i].time.toUpperCase()),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21,
                                              fontFamily: 'OverpassRegular',
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  title: Text(
                                    dummyData[i].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Container(
                                    padding:
                                    const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      dummyData[i].message,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  trailing: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            child: Icon(Icons.add_box_outlined),
                          ),
                          title: Text("Add a workspace"),
                        ),
                        ListTile(
                          leading: Container(
                            child: Icon(Icons.settings),
                          ),
                          title: Text("Preferences"),
                        ),
                        ListTile(
                          leading: Container(
                            child: Icon(Icons.help_outline),
                          ),
                          title: Text("Help"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        viewModelBuilder: () => WorkspaceViewModel());
  }
}

