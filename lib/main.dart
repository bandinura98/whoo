import 'package:flutter/material.dart';
import 'package:whoo/buy_page.dart';
import 'package:whoo/hobby.dart';
import 'package:whoo/live_stream.dart';
import 'package:whoo/login_page.dart';
import 'package:whoo/page_which_goes_chat_page.dart';
import 'package:whoo/register.dart';
import 'package:whoo/utils.dart';

import 'Chat.dart';
import 'HobbieSelection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who APp',
      theme: ThemeData(
          scaffoldBackgroundColor: Utils.BoldDarkRed,
          primarySwatch: MaterialColor(0xFF6b0702, {
            50: Color(0xFF820701),
            100: Color(0xFFfa0e02),
            200: Color(0xFFd90d02),
            300: Color(0xFFba0d04),
            400: Color(0xffa30a02),
            500: Color(0xff940901),
            600: Color(0xFF800700),
            700: Color(0xff660600),
            800: Color(0xFF520601),
            900: Color(0xff3b0401)
          }),
          accentColor: Utils.Red,
          brightness: Brightness.dark,
          primaryColor: Utils.BoldDarkRed),
      color: Utils.BoldDarkRed,
      //home: LiveStream(),
      home: MyHomePage(),
      //home: MyHomePage(title: "Live Chat"),/*adsoyad yaş cinsiyet şehir *//*ilgialanları hobiler büsürü*/
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Live Chat App"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),

            ElevatedButton(
              child: Text('register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
            ),

            ElevatedButton(
              child: Text('chat'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page_which_goes_chat_page()),
                );
              },
            ),





          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
