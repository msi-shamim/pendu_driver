import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget _builtTextField({
    String title,
    String svgUrl,
    String hinText,
    bool isSufix = false,
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
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: _builtTextField(
                        title: 'Last Name',
                        svgUrl: 'assets/svg_icon/profile.svg',
                        hinText: 'Doe',
                      ),
                    ),
                  ],
                ),
                _builtTextField(
                  title: 'Email',
                  svgUrl: 'assets/svg_icon/mail.svg',
                  hinText: 'Enter your email',
                ),
                _builtTextField(
                  title: 'Phone No',
                  svgUrl: 'assets/svg_icon/telephone.svg',
                  hinText: '+880',
                ),
                _builtTextField(
                  title: 'Password',
                  svgUrl: 'assets/svg_icon/unlock.svg',
                  hinText: '*** *** *** ***',
                ),
                _builtTextField(
                  title: 'ABN',
                  svgUrl: 'assets/svg_icon/ABN.svg',
                  hinText: '*** *** *** ***',
                ),
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
