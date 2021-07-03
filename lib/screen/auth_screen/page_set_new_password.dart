import 'package:flutter/material.dart';
import 'package:pendu_driver/api/api_call.dart';
import 'package:pendu_driver/model/model.dart';
import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';

import 'package:pendu_driver/utils/utils.dart';

class SetNewPasswordPage extends StatefulWidget {
  final String mail;
  final int otp;
  SetNewPasswordPage({@required this.mail, @required this.otp});
  @override
  _SetNewPasswordPageState createState() => _SetNewPasswordPageState(mail, otp);
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final String mail;
  final int otp;
  _SetNewPasswordPageState(this.mail, this.otp);

  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  bool validatePassword(String pass) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(pass);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/pendu_logo.png'),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                height: _height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //   SizedBox(height: 50),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        spacing: 5.0,
                        children: [
                          Text(
                            'Reset Password',
                            style: PenduTextStyle().headerStyle,
                          ),
                          Text(
                            'Enter your new password',
                            //   style: PenduTextStyle().headerStyle,
                          ),
                        ],
                      ),
                      TextFieldPasswordUtils(
                        textLabel: 'Pasword',
                        validator: (pass) {
                          if (pass == null || pass.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        controller: passController,
                      ),
                      TextFieldPasswordUtils(
                        textLabel: 'Confirm Password',
                        validator: (passCon) {
                          if (passCon == null || passCon.isEmpty) {
                            return 'Confirm Password is required';
                          }
                          if (passController.text !=
                              confirmPassController.text) {
                            return "Password do not match";
                          }
                          return null;
                        },
                        controller: confirmPassController,
                      ),
                      AuthButtonUtils(
                          width: MediaQuery.of(context).size.width * 0.90,
                          hight: 45,
                          primaryColor: Theme.of(context).primaryColor,
                          text: 'Reset password',
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _onPressed();
                            }
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() async {
    ResponseSetNewPassModel rsnp = await CallApi(context)
        .callChangePasswordApi(mail, passController.text, otp);

    rsnp.status == 200 ? _moveToNext() : _showErrorMessage(rsnp.message);
  }

  _moveToNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    SnackBarUtils.snackBarMethod(
        message: "Password change successfully", context: context);
  }

  _showErrorMessage(String msg) {
    SnackBarUtils.snackBarMethod(message: msg, context: context);
  }
}
