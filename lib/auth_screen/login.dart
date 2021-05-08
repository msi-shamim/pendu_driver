import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/auth_screen/auth_screen.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50),
            Image.asset('assets/images/pendu_logo.png'),
            //  Spacer(flex: 1),
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
                  TextFormField(
                      decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    //hintText: hintText,
                    // hintStyle: hintTextStyle(),
                  )),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        // hintText: hintText,
                        //hintStyle: hintTextStyle(),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // side: BorderSide(
                        //   color: Pendu.color('90A0B2'),
                        // ),
                      ),
                      child: Text(
                        'Login',
                        style: PenduTextStyle().btnStyle,
                      ),
                    ),
                  ),
                  Text(
                    'Forget password?',
                    style: PenduTextStyle().linkStyleStyle,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).accentColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // side: BorderSide(
                        //   color: Pendu.color('90A0B2'),
                        // ),
                      ),
                      child: Text(
                        'Register',
                        style: PenduTextStyle().btnStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
