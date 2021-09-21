import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'start_dm_view.form.dart';
import 'start_dm_viewmodel.dart';
import 'widgets/custom_chip_input.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'message'),
  ],
)



class StartDmView extends StatelessWidget with $StartDmView {
  StartDmView({Key? key}) : super(key: key);

  final _chipKey = GlobalKey<ChipsInputState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartDmViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => StartDmViewModel(),
      builder: (ctx, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Direct Message',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          actions: [
            TextButton(
              onPressed: () => print('Hello'),
              child: Text('Done'),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: model.userResults,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return CustomChipInput(
                              chipKey: _chipKey, mockResults: snapshot.data);
                        } else {
                          return Container();
                        }
                      }),
                  Divider(color: Colors.black, thickness: 0.1),
                ],
              ),
            ),
            // Positioned(
            //     child: Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Material(
            //     color: Colors.white,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Divider(height: 0, color: Color(0xFF999999)),
            //         Row(
            //           children: [
            //             Expanded(
            //               child: Container(
            //                 height: 56,
            //                 margin: EdgeInsets.only(left: 13.0),
            //                 alignment: Alignment.centerLeft,
            //                 child: FocusScope(
            //                   child: Focus(
            //                     onFocusChange: (focus) {
            //                       model.focusScope(focus);
            //                     },
            //                     child: TextField(
            //                       controller: messageController,
            //                       expands: true,
            //                       maxLines: null,
            //                       textAlignVertical: TextAlignVertical.center,
            //                       decoration: InputDecoration.collapsed(
            //                           hintText: 'Start a new message',
            //                           hintStyle: TextStyle(
            //                               color: Color(0xFFBEBEBE),
            //                               fontSize: 14.0,
            //                               fontWeight: FontWeight.w400)),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Visibility(
            //               visible: true,
            //               child: Row(
            //                 children: [
            //                   IconButton(
            //                     icon: Icon(
            //                       Icons.camera_alt_outlined,
            //                       color: Color(0xFF424141),
            //                     ),
            //                     onPressed: () {},
            //                   ),
            //                   IconButton(
            //                     icon: Icon(
            //                       Icons.attach_file_outlined,
            //                       color: Color(0xFF424141),
            //                     ),
            //                     onPressed: () {},
            //                   )
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //         Visibility(
            //             visible: model.hasClickedMessageField,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     IconButton(
            //                         onPressed: () {},
            //                         icon: Icon(
            //                           Icons.bolt_outlined,
            //                           color: Color(0xFF424141),
            //                         )),
            //                     IconButton(
            //                         onPressed: () {},
            //                         icon: Icon(
            //                           Icons.alternate_email_outlined,
            //                           color: Color(0xFF424141),
            //                         )),
            //                     IconButton(
            //                         onPressed: () {},
            //                         icon: Icon(
            //                           Icons.tag_faces_sharp,
            //                           color: Color(0xFF424141),
            //                         )),
            //                     IconButton(
            //                         onPressed: () {},
            //                         icon: Icon(
            //                           Icons.camera_alt_outlined,
            //                           color: Color(0xFF424141),
            //                         )),
            //                     IconButton(
            //                         onPressed: () {},
            //                         icon: Icon(
            //                           Icons.attach_file_outlined,
            //                           color: Color(0xFF424141),
            //                         )),
            //                   ],
            //                 ),
            //                 IconButton(
            //                     onPressed: () {
            //                       // model.sendMessage();
            //                       // FocusScope.of(context).requestFocus(FocusNode());
            //                       // _scrollController.jumpTo(
            //                       //     _scrollController.position.maxScrollExtent);
            //                       // duration: Duration(milliseconds: 500),
            //                       // curve: Curves.fastOutSlowIn);
            //                     },
            //                     icon: Icon(
            //                       Icons.send,
            //                       color: Color(0xFFBEBEBE),
            //                     ))
            //               ],
            //             ))
            //       ],
            //     ),
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
