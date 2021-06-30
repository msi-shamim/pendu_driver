import 'package:flutter/material.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool noNotvar = false;
  bool defNotvar = false;
  bool customNotvar = false;
  bool switchVar = false;
  String categoryrDopdownVar,
      timeFrameDopdownVar,
      radiusDopdownVar,
      timeDopdownVar,
      amountDopdownVar;

  TextStyle dropDownStyle = TextStyle(color: Colors.grey, fontSize: 15);

  colorChange() {
    setState(() {
      dropDownStyle = customNotvar
          ? TextStyle(color: Colors.black, fontSize: 15)
          : TextStyle(color: Colors.grey, fontSize: 15);
    });
  }

  Widget _buildNoNotification() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Pendu.color('F8F8F8')),
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Pendu.color('1B3149'),
        value: noNotvar,
        onChanged: (value) {
          setState(() {
            noNotvar = value;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          'No Notification Required',
          style: TextStyle(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildDefaultNotification() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Pendu.color('F8F8F8')),
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Pendu.color('1B3149'),
        value: defNotvar,
        onChanged: (value) {
          setState(() {
            defNotvar = value;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          'System default notifications',
          style: TextStyle(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildCustomNotification() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Pendu.color('F8F8F8')),
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Pendu.color('1B3149'),
        value: customNotvar,
        onChanged: (value) {
          setState(() {
            customNotvar = value;
            colorChange();
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          'Add custom Alerts',
          style: TextStyle(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildCategoryDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select Category',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          DropdownButton<String>(
            value: categoryrDopdownVar,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: dropDownStyle.color),
            iconSize: 30,
            elevation: 0,
            style: TextStyle(color: dropDownStyle.color),
            underline: SizedBox(),
            hint: Text(''),
            onChanged: (newValue) {
              setState(() {
                categoryrDopdownVar = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeframeDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order timeframe',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          DropdownButton<String>(
            value: timeFrameDopdownVar,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: dropDownStyle.color),
            iconSize: 30,
            elevation: 0,
            style: TextStyle(color: dropDownStyle.color),
            underline: SizedBox(),
            hint: Text(''),
            onChanged: (newValue) {
              setState(() {
                timeFrameDopdownVar = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRadiusDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order radius',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          DropdownButton<String>(
            value: radiusDopdownVar,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: dropDownStyle.color),
            iconSize: 30,
            elevation: 0,
            style: TextStyle(color: dropDownStyle.color),
            underline: SizedBox(),
            hint: Text(''),
            onChanged: (newValue) {
              setState(() {
                radiusDopdownVar = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notification time',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          DropdownButton<String>(
            value: timeDopdownVar,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: dropDownStyle.color),
            iconSize: 30,
            elevation: 0,
            style: TextStyle(color: dropDownStyle.color),
            underline: SizedBox(),
            hint: Text(''),
            onChanged: (newValue) {
              setState(() {
                timeDopdownVar = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notification amount',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          DropdownButton<String>(
            value: amountDopdownVar,
            icon: Icon(Icons.keyboard_arrow_down_outlined,
                color: dropDownStyle.color),
            iconSize: 30,
            elevation: 0,
            style: TextStyle(color: dropDownStyle.color),
            underline: SizedBox(),
            hint: Text(''),
            onChanged: (newValue) {
              setState(() {
                amountDopdownVar = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildViaText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notification via text',
            style: dropDownStyle,
            //Pendu.color('90A0B2')
          ),
          FlutterSwitch(
              width: 50.0,
              height: 20.0,
              valueFontSize: 12.0,
              toggleSize: 20.0,
              value: switchVar,
              borderRadius: 15.0,
              // padding: 8.0,
              activeColor: customNotvar ? Pendu.color('56CD93') : Colors.grey,
              inactiveColor: customNotvar ? Pendu.color('F97A7A') : Colors.grey,
              activeText: 'On',
              inactiveText: 'Off',
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  switchVar = val;
                });
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'Notification Settings'),
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: [
                    _buildNoNotification(),
                    _buildDefaultNotification(),
                    _buildCustomNotification(),
                    IgnorePointer(
                      ignoring: !customNotvar,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
                        color: Pendu.color('F8F8F8'),
                        child: Wrap(
                          children: [
                            _buildCategoryDropDown(),
                            _buildTimeframeDropDown(),
                            _buildRadiusDropDown(),
                            _buildTimeDropDown(),
                            _buildAmountDropDown(),
                            _buildViaText(),
                            SizedBox(height: 40.0)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
