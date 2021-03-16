import 'package:aachi_flutter/Add_product.dart';
import 'package:flutter/material.dart';
import 'Purchase.dart';
import 'Sales.dart';
import 'SideDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class GridLayout {
  final String title;
  final String icon;
  final Widget root;

  GridLayout({this.title, this.icon,this.root});
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<GridLayout> options;



  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

     options = [
      GridLayout(title: 'Sales', icon: 'images/icon1.png',root: Sales()),
      GridLayout(title: 'Purchase', icon: 'images/icon1.png',root: Purchase()),
      GridLayout(title: 'Add Product', icon: 'images/icon1.png',root: Add_Product()),
      GridLayout(title: 'Home', icon: 'images/icon1.png',root: Sales()),
      GridLayout(title: 'Email', icon: 'images/icon1.png',root: Sales()),
      GridLayout(title: 'Email', icon: 'images/icon1.png',root: Sales()),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...options.map(
            (i) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => i.root));
                },
                child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                    shape: CircleBorder(),
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: Image.asset(
                        i.icon,
                        fit: BoxFit.fitWidth,
                        height: 100,
                        width: 100,
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    child: Text(i.title),
                  ),
                ),
              ],
            )
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
