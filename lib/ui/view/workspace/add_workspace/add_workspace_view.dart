import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'add_workspace_viewmodel.dart';

//The Add workspace page, where user can add a new workspace
//The route to this page is '/add-workspace-view'
class AddWorkspaceView extends StatelessWidget {
  const AddWorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddWorkSpaceViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AddWorkSpaceViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 8,
            shadowColor: Colors.black38,
            title: Text(
              "Add Workspaces",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF242424),
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //TODO: Navigate to create Workspace
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  color: Color(0xFF242424),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  "Create a new workspace",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xFF424141),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 32),
                            Expanded(
                              child: Divider(
                                color: Color(0xFFD1D0D0),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Navigate to Sigin to another Workspace
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.grid_view,
                                  color: Color(0xFF242424),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  "Sign in to another workspace",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xFF424141),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 48),
                            Expanded(
                              child: Divider(
                                color: Color(0xFFD1D0D0),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Navigate to join another Workspace
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_box_outlined,
                                  color: Color(0xFF242424),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  "Join another workspace",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xFF424141),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a reply",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF727272),
                          ),
                        ),
                        cursorColor: Color(0xFF424141),
                        cursorHeight: 18,
                        cursorWidth: 2,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xFF424141),
                        ),
                        onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: ImageIcon(
                          AssetImage("assets/icons/attachment-outline.png"),
                        ),
                        highlightColor: Colors.black.withOpacity(0.2),
                        overlayColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.2)),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
