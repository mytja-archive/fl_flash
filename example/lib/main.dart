import 'package:flutter/material.dart';
import 'package:fl_flash/fl_flash.dart';

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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      Flash flash =
          Flash(mainText: Text("oops. Fail"), backgroundColor: Colors.red);
      FlashManager.add(flash);

      Flash flash2 =
          Flash(mainText: Text("yayy. Success"), backgroundColor: Colors.green);
      FlashManager.add(flash2);

      Flash flashIcon = Flash(
          mainText: Text("You can also use icons"),
          backgroundColor: Colors.green.shade100,
          icon: Icon(Icons.audiotrack));
      FlashManager.add(flashIcon);

      Flash flashAdvanced = Flash(
          mainText: Text("If that looked boring, \nhave a look at this",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green.shade100,
          icon: Icon(Icons.audiotrack));
      FlashManager.add(flashAdvanced);

      Flash flashApprove = Flash(
          mainText: Text("Approved",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green.shade300,
          icon: Icon(Icons.check));
      FlashManager.add(flashApprove);

      Flash flashDecline = Flash(
          mainText: Text("Declined",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.red.shade300,
          icon: Icon(Icons.cancel));
      FlashManager.add(flashDecline);
    });
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("fl_flash demo"),
      ),
      body: ListView(
        children: <Widget>[
          MaterialFlash(),
          Text("Here is your app body"),
          ElevatedButton(
              onPressed: () => setState(() {}), child: Text("Reload page"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add flashes',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
