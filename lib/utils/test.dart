import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class TextOne extends StatefulWidget {
  const TextOne({Key key}) : super(key: key);

  @override
  _TextOneState createState() => _TextOneState();
}

class ProductClass {
  final String title;
  final double price;
  final int quantity;
  ProductClass({this.title, this.price, this.quantity});
}

class _TextOneState extends State<TextOne> {
  List<ProductClass> _item = [];
  String _os = 'win';
  List<String> _osList = ['and', 'tux'];

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Product'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantity',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close')),
                    ElevatedButton(
                        onPressed: () {
                          _addVauleMethod();
                        },
                        child: Text('Add Product')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Container(
          height: 250.0,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Enter All Product: "),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantity',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close')),
                  ElevatedButton(
                      onPressed: () {
                        _addVauleMethod();
                      },
                      child: Text('Add Product')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _addVauleMethod() {
    setState(() {
      _item.add(ProductClass(
          title: titleController.text,
          price: double.parse(priceController.text),
          quantity: int.parse(quantityController.text)));

      titleController.clear();
      priceController.clear();
      quantityController.clear();
    });
  }
 removeValueMethod(String title) {
    setState(() {
      _item.removeWhere((item) => item.title == title);
    });
  }
  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  

  List<S2Choice<String>> osList = [
    S2Choice<String>(value: 'and', title: 'Android'),
    S2Choice<String>(value: 'ios', title: 'IOS'),
    S2Choice<String>(value: 'mac', title: 'Macintos'),
    S2Choice<String>(value: 'tux', title: 'Linux'),
    S2Choice<String>(value: 'win', title: 'Windows'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing..."),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // _showMyDialog();
                  _showBottomSheet(context);
                },
                child: Text('ADD')),
            Container(
              height: 400,
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _item.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          height: 50,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_item[i].title),
                              Text('${_item[i].price}'),
                              Text('${_item[i].quantity}'),
                              IconButton(
                                  onPressed: () {
                                    removeValueMethod(_item[i].title);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        );
                      }),
                  SmartSelect<String>.single(
                    title: 'Select your Vehicle',
                    value: _os,
                    choiceItems: osList,
                    onChange: (selected) =>
                        setState(() => _os = selected.value),
                    modalType: S2ModalType.bottomSheet,
                    tileBuilder: (context, state) {
                      return S2Tile.fromState(
                        state,
                        trailing: Icon(Icons.ac_unit),
                        isTwoLine: false,
                        title: Text('Select vehicle type'),
                        //leading: Text('Select your vehicle type'),
                      );
                    },
                  ),
                  SmartSelect<String>.multiple(
                    title: 'OS',
                    value: _osList,
                    onChange: (selected) =>
                        setState(() => _osList = selected.value),
                    choiceItems: osList,
                    modalType: S2ModalType.bottomSheet,
                    tileBuilder: (context, state) {
                      return S2Tile.fromState(
                        state,
                        isTwoLine: false,
                        title: Text('Select your Category type'),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(_os),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _osList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [Text(_osList[index])],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
