import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class InviteFriend extends StatefulWidget {
  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('90A0B2')),
          borderRadius: BorderRadius.circular(5.0)),
      child: TextFormField(
          decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Enter mail address',
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      )),
    );
  }

  Widget _buildInviteBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
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
        onPressed: () {},
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Invite a friend, you both get \$15",
          style: PenduTextStyle().headerStyle,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem",
            style: PenduTextStyle().fadedTextStyle,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        _buildTextField(),
        _buildInviteBtn(),
        Text('More ways to invite'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Pendu.color('F1F1F1')),
          alignment: Alignment.center,
          child: Text(
            "https:// www.pendshf.sdajfsd/dsfds",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        _buildCopyLinkBtn(),
        _buildShareRow()
      ],
    );
  }
}
