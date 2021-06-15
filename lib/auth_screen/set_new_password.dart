import 'package:flutter/material.dart';
import 'package:pendu_driver/auth_screen/auth_screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class SetNewPassword extends StatefulWidget {
  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
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
                          'Enter your new password',
                          //   style: PenduTextStyle().headerStyle,
                        ),
                      ],
                    ),
                    PasswordTextFormField(textLabel: 'Pasword'),
                    PasswordTextFormField(textLabel: 'Confirm Password'),
                    AuthButton(
                        width: MediaQuery.of(context).size.width * 0.90,
                        hight: 45,
                        primaryColor: Theme.of(context).primaryColor,
                        text: 'Reset password',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
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
