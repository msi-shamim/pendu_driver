import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_driver/utils/utils.dart';

List<String> itemList = [
  '2 x toothpaste',
  '3 x banana',
  '1 x soap',
  '2 x Chicken 1.5 kg'
];

class JobSearch extends StatefulWidget {
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  double itemCost = 251;
  Color faddedColor = Pendu.color('90A0B2');

  Widget _buildItemList() {
    return Container(
      height: 100,
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

  Widget _dragIcon() {
    return Container(
      margin: EdgeInsets.only(bottom: 3.0),
      width: 60,
      height: 5,
      decoration: BoxDecoration(
          color: Pendu.color('90A0B2'),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _buildShopnOffer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            height: 30,
            width: 130,
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
        Text('No Offers', style: PenduTextStyle().fadedTextStyle2),
      ],
    );
  }

  Widget _buildCategoryChip() {
    return Row(
      children: [
        ProductChip(
          label: 'Grocery',
        ),
        ProductChip(
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

  Widget _buildBottomContainer() {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: faddedColor, width: 3.0),
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'))),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nicolas L.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.0,
                        color: Pendu.color('FFB44A'),
                      ),
                      SizedBox(width: 7),
                      Text(
                        '4.89',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Pendu.color('FFCE8A'),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // side: BorderSide(
                //   color: Pendu.color('90A0B2'),
                // ),
              ),
              child: Text(
                'Make an offer',
                style: PenduTextStyle().btnStyle,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: Colors.white,
                    ),
                    Text(
                      'Help & Support',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Report',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPreviewChild() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _dragIcon(),
                _buildShopnOffer(),
                DeliverAddressTable(
                  lineHight: 20,
                  defineTextSTyle: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryChip(),
                Text(
                  '4X Items',
                  style: PenduTextStyle().fadedTextStyle2,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Task Expiring in'),
                          timeCountDown(padding: 4.0),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Item cost'),
                          Text(
                            '\$${itemCost.round()}',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedChild() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Align(alignment: Alignment.center, child: _dragIcon()),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                    Text('Time expiring in',
                        style: PenduTextStyle().headerStyle),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        timeCountDown(padding: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
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
                                style:
                                    TextStyle(color: faddedColor, fontSize: 20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
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
                      child: DeliverAddressTable(
                        lineHight: 40,
                        defineTextSTyle:
                            TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    _buildBottomContainer(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableBottomSheet(
          minExtent: 210,
          maxExtent: MediaQuery.of(context).size.height - 80,
          expansionExtent: 10,
          backgroundWidget: Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.png'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 15,
                  top: 40,
                  child: Container(
                    height: 25,
                    padding: EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: faddedColor),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          previewChild: _buildPreviewChild(),
          expandedChild: _buildExpandedChild()),
    );
  }
}
