import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';
import 'package:pendu_driver/screen/home_screen/home_page.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                height: _height / 2,
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
                          NormalTextFormField(
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
                          PasswordTextFormField(
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
                          AuthButton(
                              width: MediaQuery.of(context).size.width * 0.90,
                              hight: 45,
                              primaryColor: Theme.of(context).primaryColor,
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
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
                    AuthButton(
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
}
