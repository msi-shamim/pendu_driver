import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';

class TaskViewPage extends StatefulWidget {
  @override
  _TaskViewPageState createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
  double itemCost = 251;
  Color faddedColor = Pendu.color('90A0B2');

  Widget _buildItemList() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Text(
            itemList[index],
            style: PenduTextStyle().fadedTextStyle2,
          );
        },
      ),
    );
  }

  Widget _buildShopnOffer() {
    return Align(
      alignment: Alignment.center,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          height: 32,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              color: Theme.of(context).accentColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg_icon/shop_bag.svg',
                color: Colors.white,
              ),
              SizedBox(width: 5.0),
              Text(
                'Shop & drop',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }

  Widget _buildCategoryChip() {
    return Row(
      children: [
        ProductChipUtils(
          label: 'Grocery',
        ),
        ProductChipUtils(
          label: 'Electronics',
        ),
      ],
    );
  }

  Widget timeCountDown({double padding}) {
    return Container(
      padding: EdgeInsets.all(padding),
      color: Pendu.color('F1F1F1'),
      child: Text(
        '00 : 01 : 59 : 59',
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBarUtils(appBarTitle: 'Task View'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                _buildShopnOffer(),
                SizedBox(height: 10),
                Text('Category/Title', style: PenduTextStyle().headerStyle),
                SizedBox(height: 10),
                _buildCategoryChip(),
                SizedBox(height: 10),
                Text('Item lists', style: PenduTextStyle().headerStyle),
                _buildItemList(),
                SizedBox(height: 10),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Pendu.color('FFEBCF')),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: faddedColor,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        width: 270,
                        child: Text(
                          'Items needs to be Shopped in person for the delivery',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: PenduTextStyle().fadedTextStyle2,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text('Time expiring in', style: PenduTextStyle().headerStyle),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    timeCountDown(padding: 10.0),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: faddedColor),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item cost-'),
                          Text(
                            '\$${itemCost.round()}',
                            style: TextStyle(color: faddedColor, fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Pendu.color('E7F8EF')),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Offered delivery fee'),
                        Text(
                          '\$15',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Pendu.color('BAC5D2'),
                        Pendu.color('BAC5D2'),
                        Pendu.color('90A0B2'),
                      ],
                    ),
                  ),
                  child: DeliverAddressTableUtils(
                    lineHight: 40,
                    defineTextSTyle:
                        TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
