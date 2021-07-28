import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendu_driver/main_landing_page.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPhoneVerifyPage extends StatefulWidget {
  @override
  _OtpPhoneVerifyPageState createState() => _OtpPhoneVerifyPageState();
}

class _OtpPhoneVerifyPageState extends State<OtpPhoneVerifyPage> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  bool fullFill = false;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildOtp({double hight, double width}) {
    return Container(
      height: hight * 0.25,
      width: width * 0.40,
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.amber.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  //obscuringCharacter: '*',

                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 6) {
                      fullFill = false;

                      return null;
                    } else {
                      fullFill = true;

                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    activeColor: Theme.of(context).accentColor,
                    selectedColor: Theme.of(context).primaryColor,
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.black,
                    activeFillColor:
                        hasError ? Colors.amber.shade100 : Colors.red,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,

                  onCompleted: (v) {
                    print("Completed");
                  },

                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");

                    return false;
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the code? ",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              TextButton(
                  onPressed: () => SnackBarUtils.snackBarMethod(
                      message: "OTP resend to your Phone!", context: context),
                  child: Text(
                    "RESEND",
                    style: TextStyle(
                        color: Pendu.color('91D3B3'),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ))
            ],
          ),
          AuthButtonUtils(
              width: MediaQuery.of(context).size.width * 0.90,
              hight: 45,
              primaryColor: Theme.of(context).primaryColor,
              text: 'Confirm',
              onPressed: () {
                if (fullFill) {
                  formKey.currentState.validate();
                  // conditions for validating
                  if (currentText.length != 5 || currentText != "12345") {
                    errorController.add(ErrorAnimationType
                        .shake); // Triggering error shake animation
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    setState(
                      () {
                        hasError = false;
                        // snackBar("OTP Verified!!");
                        //work after verified
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainLandingPage(
                                      seclectValue: 0,
                                    )));
                      },
                    );
                  }
                } else {
                  SnackBarUtils.snackBarMethod(
                      message: "Fill all the field", context: context);
                }
              }),
        ],
      ),
    );
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
                // width: _width - 50,
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
                          'Enter OTP sent to your email',
                          //   style: PenduTextStyle().headerStyle,
                        ),
                        _buildOtp(hight: _height, width: _width),
                      ],
                    ),
                    //OTP
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
