import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';

import '../../shared/shared.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      onModelReady: (model) => model.fetchUser(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: model.exitPage,
            icon: const Icon(Icons.close_rounded),
          ),
          title: const Text('Edit Profile'),
          actions: [
            TextButton(
              onPressed: () async {
                await model.updateProfile();
              },
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.zuriTextBodyColor),
              ),
            )
          ],
        ),
        body: Body(size: _size),
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}

class Body extends ViewModelWidget<EditProfileViewModel> {
  final Size _size;
  Body({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, EditProfileViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: _size.height * 0.02, horizontal: _size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.14,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: _size.height * 0.14,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background/appBarLogo.png'),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.greyishColor,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            size: _size.width * 0.06,
                          )),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: _size.width * 0.55,
                    child: CustomTextField(
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      autoCorrect: false,
                      obscureText: false,
                      labelText: 'Full Name',
                      onChanged: (value) {
                        model.updateString(value, '', '', '');
                      },
                      initialValue: model.name,
                    ),

                    // TextFormField(
                    //   initialValue: model.name,
                    //   onChanged: (value) {
                    //     model.updateString(value, '', '', '');
                    //   },
                    //   decoration: const InputDecoration(
                    //     labelText: 'Full Name',
                    //   ),
                    // ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 26,
            ),
            CustomTextField(
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              autoCorrect: false,
              obscureText: false,
              labelText: 'Display Name',
              onChanged: (value) {
                model.updateString('', value, '', '');
              },
              initialValue: ''' Please open and close this '''
                  '''page twice to see changes after saving''',
              helperText: '''This is how your name will show '''
                  '''up in Zuri Chat. It’s best kept simple: whatever '''
                  '''people call you in everyday conversation.''',
              helperMaxLines: 3,
            ),

            // TextFormField(
            //   initialValue: ''' Please open and close this '''
            //       '''page twice to see changes after saving''',
            //   onChanged: (value) {
            //     model.updateString('', value, '', '');
            //   },
            //   decoration: const InputDecoration(
            //     labelText: 'Display Name',
            //     helperText: '''This is how your name will show '''
            //         '''up in Zuri Chat. It’s best kept simple: whatever '''
            //         '''people call you in everyday conversation.''',
            //     helperMaxLines: 3,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),


                       CustomTextField(
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              autoCorrect: false,
              obscureText: false,
             labelText: 'What I do',
              onChanged: (value) {
                model.updateString('', '', value, '');
              },
              initialValue: 'The Back End for this does not exist',
           helperText: 'HNGi9 X I4G'
              
            ),

            // TextFormField(
            //   initialValue: 'The Back End for this does not exist',
            //   onChanged: (value) {
            //     model.updateString('', '', value, '');
            //   },
            //   decoration: const InputDecoration(
            //       labelText: 'What I do', helperText: 'HNGi9 X I4G'),
            // ),
            SizedBox(
              height: 10,
            ),
                CustomTextField(
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              autoCorrect: false,
              obscureText: false,
              labelText: 'Phone',
               helperText: 'Enter your phone number',
         onChanged: (value) {
                model.updateString('', '', '', value);
              },
              initialValue: 'The Back End for this does not exist',
            ),

            // TextFormField(
            //   initialValue: 'The Back End for this does not exist',
            //   onChanged: (value) {
            //     model.updateString('', '', '', value);
            //   },
            //   decoration: const InputDecoration(
            //       labelText: 'Phone', helperText: 'Enter your phone number'),
            // ),
          ],
        ),
      ),
    );
  }
}
