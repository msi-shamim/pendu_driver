import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendu_driver/api/api_call.dart';
import 'package:pendu_driver/api/api_const.dart';
import 'package:pendu_driver/main_landing_page.dart';
import 'package:pendu_driver/model/model.dart';
import 'package:pendu_driver/model/response_droper_profile_with_level_model.dart';
import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiManipulation {
  final BuildContext context;
  ApiManipulation(this.context);
  var token;
  Dropper dropperVar;
  int slectedValueVar;

  getDropperProfileInfoWithLevel(String dropperToken) async {
    ResponseDrpperProfileWithLevelModel dropperProfile =
        await CallApi(context).callDroperResponseWithLevelApi(dropperToken);
    return dropperProfile.dropperWithLevelList;
  }

  validateDroper() {
    _isLoggedIn().then((loggedIn) {
      if (loggedIn) {
        fetchDropper().then((dropper) {
          if (dropper != null) {
            Timer(Duration(seconds: 3), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainLandingPage(
                          dropper: dropper, token: token, seclectValue: 0)));
            });
          } else {
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            });
          }
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
      }
    });
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(PenduConstants.spToken);
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<Dropper> fetchDropper() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spDroper);
    print('STR: $str');
    if (str != null) {
      return Dropper.fromJson(json.decode(str));
    }
    return null;
  }
}
