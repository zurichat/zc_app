import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ConnectivityServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('Connection Test', () {
      test(' if connection is online', () async {
        var connectivity = getAndRegisterConnectivityServiceMock();
        connectivity.initialize();
        await connectivity.checkConnection().whenComplete(() => true);
        verify(connectivity.checkConnection().whenComplete(() => true));
      });

      test(' if connection is offline', () async {
        var connectivity = getAndRegisterConnectivityServiceMock();
        connectivity.initialize();
        await connectivity.checkConnection().whenComplete(() => false);
        verify(connectivity.checkConnection().whenComplete(() => false));
      });
    });
  });
}
