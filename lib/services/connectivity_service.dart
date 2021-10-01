import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';

import '../utilities/enums.dart';

class ConnectivityService with ReactiveServiceMixin {
  // Creates a single instance by calling the '_internal' constructor.
  static final ConnectivityService _connectionStatus =
      ConnectivityService._internal();
  ConnectivityService._internal();

  // Retrieve the instance through the app.
  static Future<ConnectivityService> getInstance() =>
      Future.value(_connectionStatus);

  // Flags to keep track of connection state.
  bool hasConnection = false;
  ConnectivityStatus networkStatus = ConnectivityStatus.offline;

  // Allow subscription to connection changes.
  StreamController connectionChangeController = StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  // Listen for changes on initialization.
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  // Function that does the actual connection tests.
  Future<bool> checkConnection() async {
    const prevStatus = ConnectivityStatus.offline;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
        networkStatus = ConnectivityStatus.online;
      } else {
        hasConnection = false;
        networkStatus = ConnectivityStatus.offline;
      }
    } on SocketException catch (_) {
      hasConnection = false;
      networkStatus = ConnectivityStatus.offline;
    }

    // Status change sends out an update to all listeners.
    if (prevStatus != networkStatus) {
      connectionChangeController.add(networkStatus);
      onChange();
    }

    return hasConnection;
  }

  // Helper method to listen to continuous changes after initialization
  void onChange() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  void dispose() {
    connectionChangeController.close();
  }
}
