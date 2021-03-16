import 'package:flutter/material.dart';

import 'SideDrawer.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}



class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Sales'),
        )

    );
  }


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}

