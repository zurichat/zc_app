import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:hng/utilities/enums.dart';


class ConnectivityService {
  // Creates a single instance by calling the '_internal' constructor.
  // static final NetworkConnectionStatus _connectionStatus = NetworkConnectionStatus._internal();
  // NetworkConnectionStatus._internal();
  
  // Retrieve the instance through the app.
  // static NetworkConnectionStatus getInstance() => _connectionStatus;
  
  // Flags to keep track of connection state.
  bool hasConnection = false;
  ConnectivityStatus networkStatus = ConnectivityStatus.Offline;
  
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
    ConnectivityStatus prevStatus = ConnectivityStatus.Offline;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
        networkStatus = ConnectivityStatus.Online;
      } else {
        hasConnection = false;
        networkStatus = ConnectivityStatus.Offline;
      }
    } on SocketException catch(_) {
      hasConnection = false;
      networkStatus = ConnectivityStatus.Offline;
    }
    
    // Status change sends out an update to all listeners.
    if (prevStatus != networkStatus) {
      connectionChangeController.add(networkStatus);
      onChange();
    }

    return hasConnection;
  }
  
  // Helper method to listen to continuosly changes after initialization
  void onChange() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }
  
  void dispose() {
    connectionChangeController.close();
  }
}
