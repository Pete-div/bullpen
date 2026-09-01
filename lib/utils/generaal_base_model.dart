
// import 'dart:developer';

// import 'package:fishma/_lib.dart';
// import 'package:fishma/utils/loader.util.dart';
// import 'package:fishma/utils/random.dart';
// String defaultLoadingMessage = 'Loading, Please wait ...';
// class BaseViewModel extends ChangeNotifier {
//   String _userToken = '';
//   String get userToken => _userToken;

//   UserModel? _user;
//   UserModel? get user => _user;

//   void setUserToken(String token) {
//     _userToken = token;
//     notifyListeners();
//   }

//   void setUser(UserModel user) {
//     _user = user;
//     notifyListeners();
//   }

// Future<bool> performAPIAction({
//   required Future<ServerResponse> Function() action,
//   bool showSuccessToast = false,
//   bool showErrorToast = false,
//   bool showLoader = false,
//   bool showExceptionToast = false,
//   String? loadingMessage,
// }) async {
//   try {
//     if (showLoader) {
//       AppLoaderUtil.showSecondaryLoading(
//         loadingMessage ?? defaultLoadingMessage,
//       );
//     }

//     var response = await action();

//     if (showLoader) {
//       AppLoaderUtil.dismiss();
//     }

// log(' the resp: ${response.success}');
//     if (response.success) {
//       if (showSuccessToast) {
//         NotificationUtil.toast(response.msg.toString());
//       }
//     } else {
//       if (showErrorToast) {
//         NotificationUtil.toast(
//           response.msg.toString(),
//           type: ToastType.warning,
//         );
//       }
//     }

//     return response.success;
//   } catch (e,stack) {
//     print('THE ERROR: $e');
//     log('the $stack');
//     var error = "An error occurred";
//     if (e is ErrorResponse) {
//       error = e.message;
//     }

//     if (showExceptionToast) {
//       NotificationUtil.toast(error.toString(), type: ToastType.error);
//     } else if (showErrorToast) {
//       NotificationUtil.toast(error.toString(), type: ToastType.error);
//     }

//     return false;
//   }
// }
// }
