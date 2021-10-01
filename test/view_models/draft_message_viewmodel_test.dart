import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/draft/draft_viewmodel.dart';

void main() {
    DraftViewModel? model;
  Widget mockData=ListTile(
    title: Text(
      'OyinkanUA',
      style: AppTextStyles.heading6,
    ),
    subtitle: Text(
      'Why',
      style: AppTextStyles.body1Bold,
    ),
    trailing: Text(
      'August 31 at 9:09 PM',
      style: AppTextStyles.body2Bold,
    ),
  );

setUp(() {
model=DraftViewModel();
} );
  test('Drafts list increases when a draft is added ', (){  
    model!.draft.add(mockData);
    expect(model!.draft.length, 4);
  });

   test('Drafts list decreases when a draft is removed ', (){  
    model!.draft.remove(model!.draft[0]);
    expect(model!.draft.length, 2);
  });

}