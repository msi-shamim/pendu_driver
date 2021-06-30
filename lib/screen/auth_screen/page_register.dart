import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pendu_driver/api/api_call.dart';
import 'package:pendu_driver/model/model.dart';
import 'package:pendu_driver/screen/home_screen/page_home.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class ServiceCategory {
  final int id;
  final String name;

  ServiceCategory({
    this.id,
    this.name,
  });
}

class _RegisterPageState extends State<RegisterPage> {
  static List<ServiceCategory> _sCategory = [
    ServiceCategory(id: 1, name: "Shop & Drop"),
    ServiceCategory(id: 2, name: "Collect & Drop"),
    ServiceCategory(id: 3, name: "Movers"),
  ];
  final _items = _sCategory
      .map((service) => MultiSelectItem<ServiceCategory>(service, service.name))
      .toList();
  List<ServiceCategory> _selectedService = [];
  String vehicleType = '';

  List<S2Choice<String>> vehicleList = [
    S2Choice<String>(value: '1', title: 'Car'),
    S2Choice<String>(value: '2', title: 'Mini Van'),
    S2Choice<String>(value: '3', title: 'SVG'),
    S2Choice<String>(value: '4', title: 'Track'),
    S2Choice<String>(value: '5', title: 'Caverd Van'),
  ];

  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  File _dLFont, _dLBack, _profileImg;
  int vehicleId;
  List<int> serviceIdList = [];

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

  void _showCategoriesMultiSelect(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          title: Text('Select Categories',
              style: TextStyle(color: Colors.black, fontSize: 16)),
          items: _items,
          initialValue: _selectedService,
          selectedColor: Theme.of(context).accentColor,
          checkColor: Colors.white,
          maxChildSize: 0.8,
          initialChildSize: 0.4,
          confirmText: Text('Confirm',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              )),
          cancelText: Text('Cancel',
              style: TextStyle(
                color: Colors.red,
              )),
          onConfirm: (values) {
            setState(() {
              _selectedService = values;
            });
          },
        );
      },
    );
    print('Selceted Service: $_selectedService');
  }

  Widget _buildVehicleType() {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/svg_icon/vehicle_type.svg',
              height: 14,
              width: 14,
              color: Pendu.color('1B3149'),
            ),
            SizedBox(width: 5.0),
            Text('Vehicle type'),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: 40,
          //padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Pendu.color('F9F9F9'),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Text(
                'Select your Vehicle',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Expanded(
                child: SmartSelect<String>.single(
                  title: 'Select your Vehicle',
                  value: vehicleType,
                  choiceItems: vehicleList,
                  onChange: (selected) =>
                      setState(() => vehicleType = selected.value),
                  modalType: S2ModalType.bottomSheet,
                  tileBuilder: (context, state) {
                    return S2Tile.fromState(
                      state,
                      trailing: Icon(Icons.unfold_more_rounded),
                      isTwoLine: false,
                      title: SizedBox(),
                      //leading: Text('Select your vehicle type'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCategoryType() {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/svg_icon/category.svg',
              height: 14,
              width: 14,
              color: Pendu.color('1B3149'),
            ),
            SizedBox(width: 5.0),
            Text('Please select  category'),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Pendu.color('F9F9F9'),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select your category',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    _showCategoriesMultiSelect(context);
                  },
                  child: Icon(
                    Icons.unfold_more_rounded,
                    color: Pendu.color('90A0B2'),
                  ),
                ),
              ],
            )),
        SizedBox(height: 10),
      ],
    );
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

  Future getCameraImage(File images) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        images = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getGalaryImage(File images) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        images = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _showPicker(File images) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getGalaryImage(images);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getCameraImage(images);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _uploadButton(File images) {
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
            onPressed: () {
              _showPicker(images);
            },
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

  Widget _buildProfileUpload(File images) {
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
            onPressed: () {
              _showPicker(images);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Pendu.color('F6FEFA'),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: (_profileImg != null)
                ? Text('Image Uploaded')
                : SvgPicture.asset(
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
          if (_formKey.currentState.validate()) {
            _signup();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
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
          child: CommonAppBarUtils(appBarTitle: 'Register'),
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
            child: Form(
              key: _formKey,
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

                  //! Testing

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

                  _buildVehicleType(),
                  _buildCategoryType(),

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
                      _uploadButton(_dLFont),
                      _uploadButton(_dLBack),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upload profile image',
                        style: PenduTextStyle().subHeaderStyle,
                      )),
                  _buildProfileUpload(_profileImg),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ));
  }

  void _signup() async {
    if (vehicleId = null) {
      ResponseDroperRegisterModel rdrm = await CallApi(context).callSignupApi(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          contactController.text,
          abnController.text,
          passController.text,
          vehicleId,
          serviceIdList);
      rdrm.status == 200
          ? _showSuccessMessage(rdrm.message)
          : _showErrorMessage(rdrm.message);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      SnackBarUtils.snackBarMethod(
          message: 'Please input Image ', context: context);
    }
  }

  _showSuccessMessage(String msg) {
    SnackBarUtils.snackBarMethod(message: msg, context: context);
  }

  _showErrorMessage(String msg) {
    SnackBarUtils.snackBarMethod(message: msg, context: context);
  }
}
