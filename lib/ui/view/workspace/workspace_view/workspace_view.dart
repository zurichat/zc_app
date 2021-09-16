import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/models/workspace_model.dart';
import 'package:stacked/stacked.dart';
import 'workspace_viewmodel.dart';
import 'package:hng/utilities/extensions/string_extension.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkspaceViewModel>.reactive(
      onModelReady: (model) => model.fetchOrganizations(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return SafeArea(
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
                    child: Visibility(
                      visible: !model.isBusy,
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 10.0),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: model.workspaces.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                WorkspaceModel data = model.workspaces[i];
                                return ListTile(
                                  onTap: () => model.onTap(data.id),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: model.currentOrgId == data.id
                                          ? AppColors.blackColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.whiteColor,
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                        color: AppColors.greyishColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: data.imageUrl?.validateLink() ??
                                              false
                                          ? Image.network(
                                              data.imageUrl!,
                                              errorBuilder: (__, err, _) =>
                                                  Center(
                                                child: Text(
                                                  '${data.name.initials}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 21,
                                                    fontFamily:
                                                        'OverpassRegular',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                '${data.name.initials}',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 21,
                                                  fontFamily: 'OverpassRegular',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                  title: Text(
                                    data.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Container(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '${data.workSpaceUrl}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                  ),
                                  trailing: Icon(Icons.more_vert),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      replacement: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => model.navigateToNewWorkspace(),
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
        );
      },
      viewModelBuilder: () => WorkspaceViewModel(),
    );
  }
}
