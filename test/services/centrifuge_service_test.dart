import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('CentrifugeServiceTest -', () {
    final centrifugeService = getAndRegisterCentrifugeServiceMock();

    group('Centrifuge connection -', () {
      test(
          'When called it should subscribe to a channel and return a stream of events',
          () {
           // final model = Cha
        verify(centrifugeService.subscribe("channelSocketID"));
      });
    });
  });
}
