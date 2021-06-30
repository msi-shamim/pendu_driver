import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/auth_screen/auth_screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
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
                          'Enter your registrered email address',
                          //   style: PenduTextStyle().headerStyle,
                        ),
                      ],
                    ),
                    Form(
                        key: _formKey,
                        child: TextFieldNormalUtils(
                          textLabel: 'Email',
                          validator: (eMail) {
                            if (eMail == null || eMail.isEmpty) {
                              return 'Email  is required';
                            } else if (!EmailValidator.validate(eMail)) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          controller: emailController,
                        )),
                    AuthButtonUtils(
                        width: MediaQuery.of(context).size.width * 0.90,
                        hight: 45,
                        primaryColor: Theme.of(context).primaryColor,
                        text: 'Reset password',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpMailPage()));
                          }
                        }),

                    Text(
                      'Login instead',
                      //  style: PenduTextStyle().linkStyleStyle,
                    ),
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
