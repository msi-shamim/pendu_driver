import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_driver/utils/utils.dart';

class ReportProblemFormPage extends StatefulWidget {
  @override
  _ReportProblemFormPageState createState() => _ReportProblemFormPageState();
}

class _ReportProblemFormPageState extends State<ReportProblemFormPage> {
  Widget _buildTitleTextField() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Pendu.color('F1F1F1'),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pendu.color('F1F1F1'),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pendu.color('F1F1F1'),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 10,
      decoration: InputDecoration(
        filled: true,
        fillColor: Pendu.color('F1F1F1'),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pendu.color('F1F1F1'),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pendu.color('F1F1F1'),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildAttachButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: DottedBorder(
        color: Theme.of(context).accentColor,
        borderType: BorderType.RRect,
        dashPattern: [4, 4],
        strokeWidth: 1,
        radius: Radius.circular(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Pendu.color('F6FEFA'),
              onPrimary: Pendu.color('90A0B2'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              // side: BorderSide(
              //   color: Pendu.color('90A0B2'),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/svg_icon/upload.svg',
                  height: 30,
                  width: 30,
                  color: Theme.of(context).accentColor,
                ),
                Text(
                  'Attach Screenshot (Optional)',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
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
          'Submit',
          style: PenduTextStyle().btnStyle,
        ),
      ),
    );
  }

  Widget _buildMultiselect() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Pendu.color('F1F1F1'),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Choose category'), Icon(Icons.unfold_more_sharp)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBarUtils(appBarTitle: 'FAQ'),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      _buildMultiselect(),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildTitleTextField(),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildDescriptionTextField(),
                      SizedBox(height: 10.0),
                      _buildAttachButton(),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Photo added',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor)),
                          Wrap(
                            children: [
                              SvgPicture.asset('assets/svg_icon/file_icon.svg'),
                              Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Text(
                                    'DSC 651654.jpeg',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 13),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      _buildSubmitButton()
                    ],
                  )),
            )));
  }
}
