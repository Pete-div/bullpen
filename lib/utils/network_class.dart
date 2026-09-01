// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class NetworkService {
//   static final NetworkService _instance = NetworkService._internal();
//   factory NetworkService() => _instance;
//   NetworkService._internal();

//   final Connectivity _connectivity = Connectivity();
//   final StreamController<bool> _connectionChangeController =
//       StreamController<bool>.broadcast();

//   Stream<bool> get connectionChange => _connectionChangeController.stream;

//   void initialize() {
//     _connectivity.onConnectivityChanged.listen((results) async {
//       await _checkAndEmit(results);
//     });
//     checkInitialConnection();
//   }

//   void dispose() {
//     _connectionChangeController.close();
//   }

//   Future<void> checkInitialConnection() async {
//     final results = await _connectivity.checkConnectivity();
//     await _checkAndEmit(results);
//   }

//   Future<void> _checkAndEmit(List<ConnectivityResult> results) async {
//     // Check if any network interface is active
//     final hasInterface = results.any((r) => r != ConnectivityResult.none);

//     // Then do a real Internet check (ping test)
//     final hasInternet = hasInterface && await InternetConnectionChecker().hasConnection;

//     _connectionChangeController.add(hasInternet);

//     if (hasInternet) {
//       _printConnectionTypes(results);
//     } else {
//       print('No Internet Connection');
//     }
//   }

//   void _printConnectionTypes(List<ConnectivityResult> results) {
//     final types = results.map((result) {
//       switch (result) {
//         case ConnectivityResult.wifi:
//           return 'Wi-Fi';
//         case ConnectivityResult.mobile:
//           return 'Mobile Data';
//         case ConnectivityResult.ethernet:
//           return 'Ethernet';
//         case ConnectivityResult.bluetooth:
//           return 'Bluetooth';
//         case ConnectivityResult.vpn:
//           return 'VPN';
//         case ConnectivityResult.other:
//           return 'Other';
//         case ConnectivityResult.none:
//         default:
//           return 'No Connection';
//       }
//     }).toList();

//     print('Connected via: ${types.join(", ")}');
//   }
// }
