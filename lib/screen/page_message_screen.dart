import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class MessageScreeenPage extends StatefulWidget {
  @override
  _MessageScreeenPageState createState() => _MessageScreeenPageState();
}

class _MessageScreeenPageState extends State<MessageScreeenPage> {
  Widget _messageList(ChatMessage userVar) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          userVar.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          userVar.messageDate + ', ' + userVar.messageTime,
          style: TextStyle(
            fontSize: 12,
            color: Pendu.color('90A0B2'),
          ),
          textAlign: TextAlign.end,
        ),
        userVar.isText
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                    borderRadius: userVar.isSender
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            // bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0))
                        : BorderRadius.only(
                            // bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0)),
                    color: userVar.isSender
                        ? Pendu.color('F1F1F1')
                        : Pendu.color('90A0B2')),
                child: Text(userVar.text),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Pendu.color('E8EEF5'),
                  image: DecorationImage(
                    image: AssetImage(userVar.text),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
        SizedBox(height: 15.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mHeight * .75,
      width: mWidth,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Todo Header Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            // color: Colors.red,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                color: Colors.white),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'),
                  backgroundColor: Colors.transparent,
                ),
                Text('Kim L.')
              ],
            ),
          ),
          //Todo Message List
          Divider(thickness: 1.5),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) =>
                    _messageList(demeChatMessages[index]),
              ),
            ),
          ),

          //Todo Message textfield
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Pendu.color('E7F8EF')),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg_icon/clip.svg',
                  color: Pendu.color('90A0B2'),
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Write your message...',
                      hintStyle: TextStyle(color: Pendu.color('90A0B2')),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Icon(
                    Icons.send,
                    color: Pendu.color('1B3149'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
