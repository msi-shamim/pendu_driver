import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/api/api_call.dart';
import 'package:pendu_driver/model/model.dart';
import 'package:pendu_driver/utils/utils.dart';

class InviteFriend extends StatefulWidget {
  final String token;
  final Dropper dropper;
  InviteFriend({@required this.token, @required this.dropper});
  @override
  _InviteFriendState createState() => _InviteFriendState(token, dropper);
}

class _InviteFriendState extends State<InviteFriend> {
  final String token;
  final Dropper dropper;
  _InviteFriendState(this.token, this.dropper);
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
            validator: (eMail) {
              if (eMail == null || eMail.isEmpty) {
                return 'Email is required';
              } else if (!EmailValidator.validate(eMail)) {
                return 'Invalid Email';
              }
              return null;
            },
            controller: emailController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              isDense: true,
              hintText: 'Enter mail address',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            )),
      ),
    );
  }

  Widget _buildInviteBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _referMail();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).accentColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Send invite',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  Widget _buildCopyLinkBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          //dropper refer link
          Clipboard.setData(ClipboardData(text: dropper.referralLink));
          SnackBarUtils.snackBarMethod(
              message: "Link Copied to Clipboard", context: context);
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
          'Copy link',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  Widget _buildShareRow() {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Share- '),
          SvgPicture.asset('assets/svg_icon/twitter.svg'),
          SvgPicture.asset('assets/svg_icon/facebook.svg'),
          SvgPicture.asset('assets/svg_icon/insta.svg'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Invite a friend, you both get \$15",
          style: PenduTextStyle().headerStyle,
        ),
        SizedBox(height: 15.0),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem",
            style: PenduTextStyle().fadedTextStyle,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.0),
        _buildTextField(),
        SizedBox(height: 10.0),
        _buildInviteBtn(),
        SizedBox(height: 20.0),
        Text('More ways to invite'),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Pendu.color('F1F1F1')),
          alignment: Alignment.center,
          //Refer link will be here
          child: Text(
            dropper.referralLink,
            style: TextStyle(color: Colors.black54),
          ),
        ),
        SizedBox(height: 10.0),
        _buildCopyLinkBtn(),
        SizedBox(height: 15.0),
        _buildShareRow()
      ],
    );
  }

  void _referMail() async {
    ResponseSendReferMaillModel rsrmm =
        await CallApi(context).callReferbyMailApi(token, emailController.text);

    rsrmm.status == 200
        ? _showSuccessMessage(rsrmm.message)
        : _showErrorMessage(rsrmm.message);
  }

  _showSuccessMessage(String msg) {
    SnackBarUtils.snackBarMethod(message: msg, context: context);
  }

  _showErrorMessage(String msg) {
    SnackBarUtils.snackBarMethod(message: msg, context: context);
  }
}
