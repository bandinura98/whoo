import 'package:flutter/material.dart';
import 'package:whoo/show_me_page.dart';

class BuyPage extends StatefulWidget {
  @override
  BuyState createState() => BuyState();
}

class BuyState extends State<BuyPage> {
  Future<bool> _onWillPop() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("amina go");
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Satın Alma Başlık",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.red[50]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Campaign 1
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFE8AA02)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/coin_1.png",
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "1000 Taş",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "\$9.99",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.green[700],
                            child: Text("Seç"),
                          )
                        ],
                      ),
                    ),

                    //Campaign 2
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFE8AA02)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/coin_2.png",
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "5.000 Taş",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "\$9.99",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.green[700],
                            child: Text("Seç"),
                          )
                        ],
                      ),
                    ),

                    //Campaign 3
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFE8AA02)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/coin_3.png",
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "10.000 Taş",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "\$9.99",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.green[700],
                            child: Text("Seç"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ShowMePage()));
                    },
                    child: Text("Geri Dön"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
