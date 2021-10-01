import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/draft/draft_viewmodel.dart';

void main() {
    DraftViewModel? model;
  Map<String,String> mockData=     {
      "title": "oyinkaUA",
      "subtitle": "why",
      "trailing": 'August 31 at 9:09 PM'
    };

setUp(() {
model=DraftViewModel();
} );
  test('Drafts list increases when a draft is added ', (){  
    model!.draft.add(mockData);
    expect(model!.draft.length, 4);
  });

   test('Drafts list decreases when a draft is removed ', (){  
    model!.draft.remove(model!.draft[1]);
    expect(model!.draft.length, 2);
  });

}