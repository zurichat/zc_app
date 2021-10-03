import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/dm_search/dm_search_widgets.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ConnectivityServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('Online Connection Test', () {
      test(' if wifi or mobile hotspot is on, then connection comes online',
          () async {
        var connectivity = getAndRegisterConnectivityServiceMock();
        connectivity.initialize();
        await connectivity.checkConnection().whenComplete(() => true);
        verify(connectivity.checkConnection().whenComplete(() => true));
      });
    });

    group('Offline Connection Test', () {
      test(' if wifi or mobile hotspot is off, then connection goes offline',
          () async {
        var connectivity = getAndRegisterConnectivityServiceMock();
        connectivity.initialize();
        await connectivity.checkConnection().whenComplete(() => false);
        verify(connectivity.checkConnection().whenComplete(() => false));
      });
    });

    group('Disable Internet Connection', () {
      test(' if internet connection is found active, internet disabled!', () async {
        var connectivity = getAndRegisterConnectivityServiceMock();
        connectivity.initialize();
        await connectivity.checkConnection().whenComplete(() {
          onlineStatus(isOnline: false);
        });
      });
    });
  });
}
