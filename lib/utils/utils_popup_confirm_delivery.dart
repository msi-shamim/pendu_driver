import 'package:flutter/material.dart';
import 'package:pendu_driver/screen/screen.dart';
import 'package:pendu_driver/utils/utils.dart';
import 'package:rating_bar/rating_bar.dart';

class ConfirmDeliveryPopUpUtils extends StatefulWidget {
  @override
  _ConfirmDeliveryPopUpUtilsState createState() =>
      _ConfirmDeliveryPopUpUtilsState();
}

class _ConfirmDeliveryPopUpUtilsState extends State<ConfirmDeliveryPopUpUtils> {
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    double _rating = 0;

    Widget _buildRatingRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Overall rating'),
          Container(
            width: 140,
            height: 30,
            decoration: BoxDecoration(
              color: Pendu.color('E7F8EF'),
              //border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: RatingBar(
              onRatingChanged: (rating) => null,
              initialRating: _rating,
              filledIcon: Icons.star,
              emptyIcon: Icons.star,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: Pendu.color('FFB44A'),
              emptyColor: Colors.white,
              halfFilledColor: Pendu.color('FFB44A'),
              size: 22,
            ),
          ),
        ],
      );
    }

    Widget _buildSubmitButton() {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            // side: BorderSide(
            //   color: Pendu.color('90A0B2'),
            // ),
          ),
          child: Text(
            'Submit',
            style: PenduTextStyle().btnStyle,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        height: mHeight * 0.5,
        width: mWidth,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Review your experience'),
            _buildRatingRow(),
            TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                filled: true,
                fillColor: Pendu.color('FFF7EC'),
                border: InputBorder.none,
                hintText: 'Write your experience here',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
