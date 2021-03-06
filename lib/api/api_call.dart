import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pendu_driver/api/api_const.dart';
import 'package:pendu_driver/main_landing_page.dart';
import 'package:pendu_driver/model/response_droper_profile_with_level_model.dart';
import 'package:pendu_driver/model/response_single_task_info_model.dart';
import 'package:pendu_driver/model/response_single_task_via_offerId_model.dart';
import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';
import 'package:pendu_driver/screen/home_screen/page_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pendu_driver/model/model.dart';

class CallApi {
  BuildContext _context;

  CallApi(this._context);

  Future<void> callLoginApi(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://www.pendu.increments.info/api/v1/dropper/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      ResponseLoginModel rld = ResponseLoginModel.fromJson(str);

      print('from Login API: token: ${rld.droperList.accessToken}');

      String dropperStr = json.encode(rld.droperList.dropper);

      // print('UserStr: $userStr');
      _allocateInSharedPref(_context, dropperStr, rld.droperList.accessToken);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseDroperRegisterModel> callSignupApi(
      String fName,
      String lName,
      String email,
      String phone,
      String abn,
      String password,
      int vehicleId,
      List<int> serviceIds) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST',
        Uri.parse('https://www.pendu.increments.info/api/v1/dropper/register'));
    request.body = json.encode({
      "first_name": fName,
      "last_name": lName,
      "email": email,
      "phone": phone,
      "abn": abn,
      "vehicle_id": vehicleId,
      "service_ids": serviceIds,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      ResponseDroperRegisterModel rdrm =
          ResponseDroperRegisterModel.fromJson(str);
      callLoginApi(rdrm.data.email, password);
      return rdrm;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<PutDroperUpdateModel> callDroperUpdateApi(
      String accessToken, String fName, String lName, String abn) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('PUT',
        Uri.parse('https://www.pendu.increments.info/api/v1/dropper/profile'));
    request.body =
        json.encode({"first_name": fName, "last_name": lName, "abn": abn});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('fromUpdate Api $str');
      return PutDroperUpdateModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseDropperProfileModel> callDroperResponseApi(
      String accessToken) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET',
        Uri.parse('https://www.pendu.increments.info/api/v1/dropper/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('From droper respons API $str');
      return ResponseDropperProfileModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseDrpperProfileWithLevelModel> callDroperResponseWithLevelApi(
      String accessToken) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/profile?level'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('From droper respons API $str');
      return ResponseDrpperProfileWithLevelModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

//Send mail to user
  Future<ResponseMailModel> callSendMailApi(String mail) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/password/email'));
    request.body = json.encode({"email": mail});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Response mail: $str');
      return ResponseMailModel.fromJson(str);
    } else {
      return null;
    }
  }

  //Confirm OTP
  Future<ResponseOtpConfirmModel> callConfirmOTPApi(
      String inputMail, int otpCode) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/password/confirm'));
    request.body = json.encode({"email": inputMail, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from verify Mail: $str');
      return ResponseOtpConfirmModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

//Confirm password
  Future<ResponseSetNewPassModel> callChangePasswordApi(
      String inputMail, String password, int otpCode) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/password/reset'));
    request.body =
        json.encode({"email": inputMail, "password": password, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from  ResetPassword: $str');
      return ResponseSetNewPassModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseBlogPostModel> callBlogPostApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/posts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Blog API: $str');
      return ResponseBlogPostModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseBlogPostModel> callBlogSinglePostApi(
      int blogId, String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/posts/' + '$blogId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Blog Single API: $str');
      return ResponseBlogPostModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseVehiclesDataModel> callVehicleDataApi(
      String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/vehicles'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Vehicle Data API: $str');
      return ResponseVehiclesDataModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseServiceCategoryModel> callServiceCategoryApi(
      String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/service-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from service category API: $str');
      return ResponseServiceCategoryModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseProductCategoryModel> callProductCategoryApi(
      String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/product-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from product category API: $str');
      return ResponseProductCategoryModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseCouponDataModel> callCouponDataApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/coupons/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from product category API: $str');
      return ResponseCouponDataModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseCouponDataModel> callSingleCouponDataApi(
      String accessToken, int couponId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/coupons/$couponId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from  Coupon Model API: $str');
      return ResponseCouponDataModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callSubmitTaskOfferApi(
      String accessToken, int taskOfferId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/$taskOfferId/submit-offer'));
    request.body = json.encode({"amount": 90});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Submit Task API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<void> callGetPendingTaskApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/pending'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Pending Task API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<void> callGetConfirmedTaskApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/confirmed'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Confirmed Task API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<void> callGetProgressTaskApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/in-progress'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Progress Task API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<void> callGetCompletedTaskApi(String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/completed'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Completed Task API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<void> callSubmitReviewTaskApi(
      String accessToken, double rating, String review) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/review-submit'));
    request.body = json.encode({
      "rating": rating,
      "review": review,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var str = await response.stream.bytesToString();
        print('from Submit Review API: $str');
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  Future<ResponseSingleTaskInfoViaOfferIdModel>
      callGetSingleTaskViaOffersIdResponseApi(
          String accessToken, int offersId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/task-view/offers/$offersId'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Single Task via OfferID API: $str');
      return ResponseSingleTaskInfoViaOfferIdModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseAllTaskForMapModel> callGetAllTaskResponseForMapApi(
      String accessToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/map-show'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from All Task API: $str');
      return ResponseAllTaskForMapModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseSingleTaskInfoModel> callGetSingleTaskResponseApi(
      String accessToken, int taskId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/$taskId'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Single Task API: $str');
      return ResponseSingleTaskInfoModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callSubmitTaskMakeOfferApi(
      String accessToken, double offerAmount, int taskId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/tasks/$taskId'));
    request.body = json.encode({"amount": offerAmount});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> callStartTaskApi(String accessToken, int offerId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/task-start'));
    request.body = json.encode({"offer_id": offerId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<ResponseSendReferMaillModel> callReferbyMailApi(
      String accessToken, String mail) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/refer-n-earn'));
    request.body = json.encode({"email": mail});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Refer Mail API: $str');
      return ResponseSendReferMaillModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

//Logout Function
  Future<bool> callDropperLogout(
      String accessToken, BuildContext context) async {
    Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
    sharedPref.then((value) {
      value.remove(PenduConstants.spDroper);
      value.remove(PenduConstants.spToken);
      Navigator.pushReplacement<void, void>(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    return null;
    // var headers = {
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $accessToken,'
    // };
    // var request = http.Request('POST',
    //     Uri.parse('https://www.pendu.increments.info/api/v1/dropper/logout'));

    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    //   SharedPreferences sharedPreferences =
    //       await SharedPreferences.getInstance();
    //   // var token = sharedPreferences.getString(PenduConstants.spToken);
    //   bool wipeUser, wipeToken;
    //   wipeUser =
    //       await sharedPreferences.setString(PenduConstants.spDroper, null);
    //   wipeToken =
    //       await sharedPreferences.setString(PenduConstants.spToken, null);
    //   return wipeUser && wipeToken;
    // } else {
    //   print(response.reasonPhrase);
    // return false;
    // }
  }
}

void _allocateInSharedPref(
    BuildContext context, String dropper, String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await sharedPreferences.setString(PenduConstants.spDroper, dropper);
  await sharedPreferences.setString(PenduConstants.spToken, token);
  print('from shared pref: $token');

  if (sharedPreferences.getString(PenduConstants.spToken) != null) {
    // ignore: unused_local_variable
    Dropper dDroper = Dropper.fromJson(json.decode(dropper));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainLandingPage(
                dropper: dDroper, token: token, seclectValue: 0)));
  } else {
    print('from shared pref: Token null');
  }
}
