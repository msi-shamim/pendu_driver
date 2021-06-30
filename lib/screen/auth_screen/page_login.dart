import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/api/api_call.dart';

import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';
import 'package:pendu_driver/screen/home_screen/page_home.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkValue = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                height: _height * 0.52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login/Register',
                      style: PenduTextStyle().headerStyle,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldNormalUtils(
                            textLabel: 'Email',
                            validator: (eMail) {
                              if (eMail == null || eMail.isEmpty) {
                                return 'Email is required';
                              } else if (!EmailValidator.validate(eMail)) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                          SizedBox(height: 10.0),
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
                          SizedBox(height: 10.0),
                          AuthButtonUtils(
                              width: MediaQuery.of(context).size.width * 0.90,
                              hight: 45,
                              primaryColor: Theme.of(context).primaryColor,
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _logInMethod();
                                }
                              }),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
                        },
                        child: Text(
                          'Forget password?',
                          style: PenduTextStyle().linkStyleStyle,
                        )),
                    AuthButtonUtils(
                        width: MediaQuery.of(context).size.width * .70,
                        hight: 48,
                        primaryColor: Theme.of(context).accentColor,
                        text: 'Register',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        }),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  void _logInMethod() {
    var callLoginApi = CallApi(context);
    callLoginApi.callLoginApi(emailController.text, passController.text);
  }
}
