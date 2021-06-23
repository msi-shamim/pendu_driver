import 'package:dotted_border/dotted_border.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final abnController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    contactController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    abnController..dispose();
    vehicleTypeController.dispose();
    categoryController..dispose();
    super.dispose();
  }

  bool validatePassword(String pass) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(pass);
  }

  Widget _builtTextField({
    String title,
    String svgUrl,
    String hinText,
    bool isSufix = false,
    TextEditingController controller,
    Function validator,
  }) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgUrl,
              height: 14,
              width: 14,
              color: Pendu.color('1B3149'),
            ),
            SizedBox(width: 5.0),
            Text(title),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          //   height: hight != 0 ? hight : 200,
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: TextFormField(
            maxLines: 1,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hinText,
              filled: true,
              fillColor: Pendu.color('F9F9F9'),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('F9F9F9'),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('5BDB98'),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: isSufix
                  ? Icon(
                      Icons.unfold_more_rounded,
                      color: Pendu.color('90A0B2'),
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _uploadButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: DottedBorder(
        color: Theme.of(context).accentColor,
        borderType: BorderType.RRect,
        dashPattern: [4, 4],
        strokeWidth: 1,
        radius: Radius.circular(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Pendu.color('F6FEFA'),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              // side: BorderSide(
              //   color: Pendu.color('90A0B2'),
              // ),
            ),
            child: SvgPicture.asset(
              'assets/svg_icon/upload.svg',
              height: 40,
              width: 40,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileUpload() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: DottedBorder(
        color: Theme.of(context).accentColor,
        borderType: BorderType.RRect,
        dashPattern: [4, 4],
        strokeWidth: 1,
        radius: Radius.circular(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Pendu.color('F6FEFA'),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              // side: BorderSide(
              //   color: Pendu.color('90A0B2'),
              // ),
            ),
            child: SvgPicture.asset(
              'assets/svg_icon/upload.svg',
              height: 40,
              width: 40,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
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
          'Submit application',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar(appBarTitle: 'Register'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Become a dropper',
                    style: PenduTextStyle().headerStyle,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: _builtTextField(
                        title: 'First Name',
                        svgUrl: 'assets/svg_icon/profile.svg',
                        hinText: 'John',
                        validator: (fName) {
                          if (fName == null || fName.isEmpty) {
                            return 'First Name is required';
                          }
                          return null;
                        },
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: _builtTextField(
                        title: 'Last Name',
                        svgUrl: 'assets/svg_icon/profile.svg',
                        hinText: 'Doe',
                        validator: (lName) {
                          if (lName == null || lName.isEmpty) {
                            return 'Last Name is required';
                          }
                          return null;
                        },
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                _builtTextField(
                  title: 'Email',
                  svgUrl: 'assets/svg_icon/mail.svg',
                  hinText: 'Enter your email',
                  validator: (eMail) {
                    if (eMail == null || eMail.isEmpty) {
                      return 'Email Name is required';
                    } else if (!EmailValidator.validate(eMail)) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                _builtTextField(
                  title: 'Phone No',
                  svgUrl: 'assets/svg_icon/telephone.svg',
                  hinText: '+880',
                  validator: (cnt) {
                    if (cnt == null || cnt.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (cnt.length < 9) {
                      return "Please enter valid phone";
                    }
                    return null;
                  },
                  controller: contactController,
                ),
                _builtTextField(
                  title: 'Password',
                  svgUrl: 'assets/svg_icon/unlock.svg',
                  hinText: '*** *** *** ***',
                  validator: (pass) {
                    if (pass == null || pass.isEmpty) {
                      return 'Password is required';
                    }
                    if (pass.length < 8) {
                      return "Password at least 8 character";
                    }
                    return null;
                  },
                  controller: passController,
                ),
                _builtTextField(
                  title: 'ABN',
                  svgUrl: 'assets/svg_icon/ABN.svg',
                  hinText: '*** *** *** ***',
                  validator: (abn) {
                    if (abn == null || abn.isEmpty) {
                      return 'ABN number is required';
                    }
                    if (abn.length < 5) {
                      return "Please enter valid ABN number";
                    }
                    return null;
                  },
                  controller: abnController,
                ),

                //!Need to work from here
                _builtTextField(
                    title: 'Vehicle type',
                    svgUrl: 'assets/svg_icon/vehicle_type.svg',
                    hinText: 'Select your vehicle',
                    isSufix: true),
                _builtTextField(
                    title: 'Please select category',
                    svgUrl: 'assets/svg_icon/category.svg',
                    hinText: 'Select your category',
                    isSufix: true),
                SizedBox(height: 10.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Upload driving licence -Front & Back',
                      style: PenduTextStyle().subHeaderStyle,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _uploadButton(),
                    _uploadButton(),
                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Upload profile image',
                      style: PenduTextStyle().subHeaderStyle,
                    )),
                _buildProfileUpload(),
                _buildButton(),
              ],
            ),
          ),
        ));
  }
}
