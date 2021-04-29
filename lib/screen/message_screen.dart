import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ChatMessage {
  final String text;
  final bool isText;
  final String messageDate;
  final String messageTime;
  final bool isSender;

  ChatMessage({
    this.text,
    @required this.isText,
    @required this.messageDate,
    @required this.messageTime,
    @required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text:
        "Hey Fly 9! \n I was tossing and turning all night! I haven't slept a wink in 3 days! What's keeping you up? Nothing really.",
    isText: true,
    messageDate: 'Nov 4',
    messageTime: '18:03',
    isSender: false,
  ),
  ChatMessage(
    text:
        "Where are you going? I am going to the salon for my haircut. What hairstyle would you like?",
    isText: true,
    messageDate: 'Nov 5',
    messageTime: '10:25',
    isSender: true,
  ),
  ChatMessage(
    text: "assets/images/msg_img.png",
    isText: false,
    messageDate: 'Nov 6',
    messageTime: '13:25',
    isSender: false,
  ),
  ChatMessage(
    text: "Thanks",
    isText: true,
    messageDate: 'Nov 7',
    messageTime: '09:18',
    isSender: true,
  ),
  ChatMessage(
    text: "assets/images/msg_img.png",
    isText: false,
    messageDate: 'Nov 7',
    messageTime: '09:20',
    isSender: true,
  ),
  ChatMessage(
    text: "You are Welcome",
    isText: true,
    messageDate: 'Nov 8',
    messageTime: '11:40',
    isSender: false,
  ),
];

class MessageScreeen extends StatefulWidget {
  @override
  _MessageScreeenState createState() => _MessageScreeenState();
}

class _MessageScreeenState extends State<MessageScreeen> {
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