import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  final client = centrifuge.createClient("$websocketUrl?format=protobuf");
}
