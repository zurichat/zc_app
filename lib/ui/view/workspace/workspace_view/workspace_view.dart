import 'package:flutter/material.dart';
import '../../../../models/workspace_model.dart';
import '../../../shared/shared.dart';
import 'package:stacked/stacked.dart';

import 'workspace_viewmodel.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkspaceViewModel>.reactive(
      onModelReady: (model) => model.initViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Workspaces',
                        style: AppTextStyles.heading6
                            .copyWith(color: AppColors.blackColor)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: !model.isBusy,
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: model.workspaces.isEmpty
                            ? Text("No Organization Available!")
                            : Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: model.workspaces.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      final org = model.workspaces[i];
                                      return OrganizationTile(org: org);
                                    },
                                  ),
                                ],
                              ),
//                                : Column(
//                                    children: [
//                                      SizedBox(height: 10.0),
//                                      ListView.builder(
//                                        physics: NeverScrollableScrollPhysics(),
//                                        itemCount: model.workspaces.length,
//                                        shrinkWrap: true,
//                                        itemBuilder: (context, i) {
//                                          WorkspaceModel data =
//                                              model.workspaces[i];
//                                          return ListTile(
//                                            onTap: () => model.onTap(data.id),
//                                            leading: Container(
//                                              height: 50,
//                                              width: 50,
//                                              padding: EdgeInsets.all(2),
//                                              decoration: BoxDecoration(
//                                                color: model.currentOrgId ==
//                                                        data.id
//                                                    ? AppColors.blackColor
//                                                    : AppColors.whiteColor,
//                                                borderRadius:
//                                                    BorderRadius.circular(5),
//                                              ),
//                                              child: Container(
//                                                height: 45,
//                                                width: 45,
//                                                decoration: BoxDecoration(
//                                                  border: Border.all(
//                                                    color: AppColors.whiteColor,
//                                                    width: 2,
//                                                    style: BorderStyle.solid,
//                                                  ),
//                                                  color: AppColors.greyishColor,
//                                                  borderRadius:
//                                                      BorderRadius.circular(5),
//                                                ),
//                                                clipBehavior: Clip.antiAlias,
//                                                child: data.imageUrl
//                                                            ?.validateLink() ??
//                                                        false
//                                                    ? Image.network(
//                                                        data.imageUrl!,
//                                                        errorBuilder:
//                                                            (__, err, _) =>
//                                                                Center(
//                                                          child: Text(
//                                                            '${data.name.initials}',
//                                                            textAlign: TextAlign
//                                                                .center,
//                                                            style: TextStyle(
//                                                              color:
//                                                                  Colors.black,
//                                                              fontSize: 21,
//                                                              fontFamily:
//                                                                  'OverpassRegular',
//                                                              fontWeight:
//                                                                  FontWeight
//                                                                      .bold,
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      )
//                                                    : Center(
//                                                        child: Text(
//                                                          '${data.name.initials}',
//                                                          textAlign:
//                                                              TextAlign.center,
//                                                          maxLines: 1,
//                                                          style: TextStyle(
//                                                            color: Colors.black,
//                                                            fontSize: 21,
//                                                            fontFamily:
//                                                                'OverpassRegular',
//                                                            fontWeight:
//                                                                FontWeight.bold,
//                                                          ),
//                                                        ),
//                                                      ),
//                                              ),
//                                            ),
//                                            title: Text(
//                                              data.name,
//                                              style: TextStyle(
//                                                  fontWeight: FontWeight.bold),
//                                            ),
//                                            subtitle: Container(
//                                              padding: const EdgeInsets.only(
//                                                  top: 5.0),
//                                              child: Text(
//                                                '${data.workSpaceUrl}',
//                                                style: TextStyle(
//                                                    color: Colors.grey,
//                                                    fontSize: 15.0),
//                                              ),
//                                            ),
//                                            trailing: Icon(Icons.more_vert),
//                                          );
//                                        },
//                                      ),
//                                    ],
//                                  ),
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

class OrganizationTile extends ViewModelWidget<WorkspaceViewModel> {
  const OrganizationTile({
    Key? key,
    required this.org,
  }) : super(key: key);

  final WorkspaceModel org;

  @override
  Widget build(BuildContext context, WorkspaceViewModel model) {
    return ListTile(
      onTap: () => model.onTap(org.id, org.name, org.workSpaceUrl),
      leading: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.height * 0.06,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: model.currentOrgId == org.id
              ? AppColors.blackColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
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
          //TODO : Add the org image here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      //TODO : Add the org name here
      title: Text(
        org.name ?? '',
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: 2,
        style: AppTextStyles.heading7.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      subtitle: Container(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          org.workSpaceUrl ?? '',
          style: AppTextStyles.body3Medium,
        ),
      ),
      trailing: GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
    );
  }
}
