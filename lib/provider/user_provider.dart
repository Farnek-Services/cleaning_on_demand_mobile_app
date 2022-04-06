import 'dart:io';
import 'package:carbon_footprint/helper/api_service.dart';
import 'package:carbon_footprint/Helper/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:carbon_footprint/model/user_details_model.dart';

class UserProvider extends ChangeNotifier {
  UserDetailsModel? _userDetailsModel;
  bool _isSocialLogin = Platform.isIOS ? false : true;
  bool get isSocialLogin => _isSocialLogin;
  String _notificationCount = "8";

  String get notificationCount => _notificationCount;

  set notificationCount(String value) {
    _notificationCount = value;
    notifyListeners();
  }

  set isSocialLogin(bool value) {
    _isSocialLogin = value;
    notifyListeners();
  }

  UserDetailsModel? get userDetailsModel => _userDetailsModel;

  set userDetailsModel(UserDetailsModel? value) {
    _userDetailsModel = value;
    notifyListeners();
  }

//   callNotificationCount() {
//     Themes.getUserData().then((value) {
//       if (value != null) {
// //  Themes.showDialogLoader(_scaffoldKey.currentContext);
//         ApiService.getNotificationCount().then((apiResponse) {
// //      Themes.hideDialogLoader();
//           if (apiResponse.apiResponseModel != null) {
//             bool status = apiResponse.apiResponseModel.response.status;
//             String message = apiResponse.apiResponseModel.response.message;
//             if (status) {
//               String notificationCount =
//                   apiResponse.apiResponseModel.result["notification_count"];
//               if (this.notificationCount != notificationCount) {
//                 this.notificationCount =
//                     notificationCount == null ? '' : notificationCount;
//               }
//             }
//           } else {}
//         });
//       }
//     });
//   }
  /* callGetUserDetails() {
    ApiService.getUserDetails().then((apiResponse) {
      if (apiResponse.response != null) {
        bool status = apiResponse.response["response"]["status"];
        if (status) {
          var customerJson = apiResponse.response["result"]["user_details"];
          if (customerJson != null) {
            Themes.saveUserData(customerJson).then((value) {
              _userDetailsModel = UserDetailsModel.fromJson(customerJson);
            });
          }
        } else {
          if (userDetailsModel != null) {
            Themes.clearUserData();
            userDetailsModel = null;
            Themes.navigatorKey.currentContext.read<CartProvider>().cartCount =
                "";
          }
//        String message = apiResponse.response["response"]["message"];
        }
      } else {
        // if (userDetailsModel != null) {
        //   Themes.clearUserData();
        //   userDetailsModel = null;
        //   Themes.navigatorKey.currentContext.read<CartProvider>().cartCount =
        //       "";
        // }
      }
    });
  }*/

  // callShowSocialLogin({@required String version}) {
  //   if (Platform.isIOS) {
  //     ApiService.showSocialLogin(
  //             showSocialLoginParams: ShowSocialLoginParams(version: version))
  //         .then((apiResponse) {
  //       if (apiResponse.response != null) {
  //         bool status = apiResponse.response["response"]["status"];
  //         if (status) {
  //           bool isSocialLogin =
  //               apiResponse.response["result"]["is_social_login"];
  //           _isSocialLogin = isSocialLogin == null ? true : isSocialLogin;
  //         } else {}
  //       } else {}
  //     });
  //   }
  // }
}
