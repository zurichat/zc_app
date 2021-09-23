import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../shared/shared.dart';
import 'create_workspace_viewmodel.dart';

class CreateWorkSpace extends StatelessWidget {
  //The users email address can be passed in here from the api or database

  const CreateWorkSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkSpaceViewModel>.nonReactive(
      viewModelBuilder: () => CreateWorkSpaceViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'x',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: PageView(
                      children: [
                        CompanyPage(),
                        CompanyPage(),
                        CompanyPage(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectPage extends ViewModelWidget<CreateWorkSpaceViewModel> {
  const ProjectPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateWorkSpaceViewModel model) {
    return Column(
      // crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      // verticalDirection: verticalDirection,
      // textBaseline: textBaseline,
      // textDirection: textDirection,
      children: [
        Spacer(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Text(
            "What's a project your team is working on?",
            style: TextStyle(
              letterSpacing: 0.5,
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextForm(
          hintText: 'Eg.  Q4 Budget, Website Update',
          wordCount: 80,
        ),
        NextButton(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'By continuing, you are agreeing to our ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Customer’s Term of Service, Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Cookie Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: model.checkBoxVal,
            onChanged: model.onCheckBoxChanged,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'It’s okay to send me email with slack app, news and offer',
              style: TextStyle(),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class InvitePage extends ViewModelWidget<CreateWorkSpaceViewModel> {
  const InvitePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateWorkSpaceViewModel model) {
    return Column(
      // crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      // verticalDirection: verticalDirection,
      // textBaseline: textBaseline,
      // textDirection: textDirection,
      children: [
        Spacer(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Text(
            "What's the name of the\ncompany or team?",
            style: TextStyle(
              letterSpacing: 0.5,
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextForm(
          hintText: 'name@eample.com',
        ),
        NextButton(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'By continuing, you are agreeing to our ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Customer’s Term of Service, Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Cookie Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: model.checkBoxVal,
            onChanged: model.onCheckBoxChanged,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'It’s okay to send me email with slack app, news and offer',
              style: TextStyle(),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class CompanyPage extends ViewModelWidget<CreateWorkSpaceViewModel> {
  const CompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateWorkSpaceViewModel model) {
    return Column(
      // crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      // verticalDirection: verticalDirection,
      // textBaseline: textBaseline,
      // textDirection: textDirection,
      children: [
        Spacer(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Text(
            "What's the name of the\ncompany or team?",
            style: TextStyle(
              letterSpacing: 0.5,
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextForm(
          hintText: 'Eg.  HNG I8 / Team Socrates',
          wordCount: null,
        ),
        NextButton(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'By continuing, you are agreeing to our ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Customer’s Term of Service, Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: 'Cookie Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.appBarGreen,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: model.checkBoxVal,
            onChanged: model.onCheckBoxChanged,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'It’s okay to send me email with slack app, news and offer',
              style: TextStyle(),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class TextForm extends HookViewModelWidget<CreateWorkSpaceViewModel> {
  final int? wordCount;
  final String hintText;
  TextForm({Key? key, this.wordCount, required this.hintText})
      : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateWorkSpaceViewModel model) {
    return Center(
      child: TextField(
        maxLength: this.wordCount,
        decoration: InputDecoration(
          // labelText: '',
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffBEBEBE),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.greyishColor,
              width: 2,
            ),
          ),
          // focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.ZuriGrey,
              width: 2,
            ),
          ),
          errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
        ),
        onChanged: (value) {
          // model.updateString(value);
        },
      ),
    );
  }
}

class NextButton extends ViewModelWidget<CreateWorkSpaceViewModel> {
  NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, CreateWorkSpaceViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                model.textController.text.isEmpty
                    ? Color(0xffBEBEBE)
                    : AppColors.appBarGreen)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Container(
            width: 300,
            child: Center(
              child: Text(
                'Next',
                style: AppTextStyles.buttonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
