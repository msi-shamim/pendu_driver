import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ShoppingItemsModel {
  bool checked;
  final String itemTitle;
  final double itemQuantity;
  bool unAvaliable;
  File itemPic;

  ShoppingItemsModel(
      {this.checked,
      this.itemTitle,
      this.itemQuantity,
      this.unAvaliable,
      this.itemPic});
}

List<ShoppingItemsModel> _shoppingItemList = [
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
  ShoppingItemsModel(
      checked: false,
      itemTitle: 'Shopping item',
      itemQuantity: 1,
      unAvaliable: false,
      itemPic: null),
];

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  bool answer = true;

  final picker = ImagePicker();

  Future getCameraImage(ShoppingItemsModel indexVar) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        indexVar.itemPic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getGallaryImage(ShoppingItemsModel indexVar) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        indexVar.itemPic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _showPicker(ShoppingItemsModel indexVar) {
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
                        getGallaryImage(indexVar);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getCameraImage(indexVar);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  bool completedFunction() {
    for (var i = 0; i < _shoppingItemList.length; i++) {
      if (_shoppingItemList[i].checked == true ||
          _shoppingItemList[i].unAvaliable == true) {
        setState(() {
          answer = true;
        });
      } else
        setState(() {
          answer = false;
        });
    }
    return answer;
  }

  Widget _buildChatBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return MessageScreeen();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/svg_icon/chat_icon.svg'),
            Text('Chat with cutomer')
          ],
        ),
      ),
    );
  }

  Widget _buildItemList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _shoppingItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 245,

                /// color: Colors.red,
                child: CheckboxListTile(
                  value: _shoppingItemList[index].checked,
                  activeColor: Theme.of(context).accentColor,
                  onChanged: (value) {
                    setState(() {
                      _shoppingItemList[index].checked = value;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Text(
                          _shoppingItemList[index].itemTitle + '$index',
                          style: TextStyle(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                          " X ${_shoppingItemList[index].itemQuantity.round()}")
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 80,
                //  color: Colors.blue,
                margin: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_shoppingItemList[index].unAvaliable == false) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                content: new Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text("Is this prodcut unavailable?"),
                                Text("Request substitute"),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Pendu.color('F97A7A'),
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: PenduTextStyle().btnStyle,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _shoppingItemList[index].unAvaliable =
                                              !_shoppingItemList[index]
                                                  .unAvaliable;
                                          _shoppingItemList[index].checked =
                                              false;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        primary: Pendu.color('5BDB98'),
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: Text(
                                        '  Yes  ',
                                        style: PenduTextStyle().btnStyle,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          );
                        } else {
                          setState(() {
                            _shoppingItemList[index].unAvaliable =
                                !_shoppingItemList[index].unAvaliable;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: (_shoppingItemList[index].unAvaliable)
                            ? Pendu.color('F97A7A')
                            : Pendu.color('E8E8E8'),
                        child: SvgPicture.asset(
                          'assets/svg_icon/substitute_bag.svg',
                          height: 12,
                          width: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showPicker(_shoppingItemList[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: _shoppingItemList[index].itemPic != null
                            ? Image.file(
                                _shoppingItemList[index].itemPic,
                                width: 30,
                                height: 20,
                                fit: BoxFit.fill,
                              )
                            : SvgPicture.asset('assets/svg_icon/add_img.svg',
                                height: 24, width: 24, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget _buildBottomContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Pendu.color('FFEBCF')),
      padding: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 10),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                width: 280,
                child: Text(
                  'Photos are sent to the customer in real time.',
                  style: PenduTextStyle().fadedTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.circle, size: 10),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                width: 280,
                child: Text(
                  'Please check with the customer via chat before marking an item unavailable.',
                  style: PenduTextStyle().fadedTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return ShoppingBottomPopup();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: answer ? Theme.of(context).primaryColor : Colors.red,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Shopping completed',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Shopping',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: SvgPicture.asset('assets/svg_icon/shopping_img.svg'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shooping item'),
                  _buildChatBtn(),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: PenduTextStyle().fadedTextStyle.color),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: _buildItemList(),
              ),
              _buildBottomContainer(),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}
