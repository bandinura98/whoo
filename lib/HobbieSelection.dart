import 'package:flutter/material.dart';
import 'package:whoo/random_chat_page.dart';

import 'hobby.dart';



class HobbieSelection extends StatefulWidget {
  @override
  _HobbieSelectionState createState() => _HobbieSelectionState();
}

/*
* child: OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                      ),
                      onPressed: () { },
                      child: Text('${sporHobbyList[index]}'),
                    ),
* */


class _HobbieSelectionState extends State<HobbieSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => HobbieLists("spor")));},

              child: Text('Spor hobi'),
            ),

            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => HobbieLists("acikhava")));},

              child: Text('açık hava ve doğa hobi'),
            ),

            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => HobbieLists("koleksyon")));},

              child: Text('Koleksyonculuk hobi'),
            ),

            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => HobbieLists("online")));},

              child: Text('0nline hobi'),
            ),

            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => HobbieLists("sosyal")));},

              child: Text('Sosyal hobi'),
            ),
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => RandomChatPage()));
                        builder: (context) => RandomChatPage()));},

              child: Text('\ntamam\n'),
            ),
          ],
        ),
      ),
    );
  }
}