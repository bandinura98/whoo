
import 'package:flutter/material.dart';
import 'package:whoo/models.dart';

import 'Chat.dart';

int chid = 1;

class Page_which_goes_chat_page extends StatefulWidget {
  Page_which_goes_chat_page({Key key}) : super(key: key);
  @override
  _Page_which_goes_chat_page createState() => _Page_which_goes_chat_page();
}
class _Page_which_goes_chat_page extends State<Page_which_goes_chat_page> {
  List<UserModel> userList= [UserModel()]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(

          gridDelegate: gridDelegate, itemBuilder: itemBuilder).count(
          crossAxisCount: 3,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Sema"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Ahu"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=3;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Alev"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=4;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Zarina"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=5;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Açelya"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                chid=6;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Text("Ebru"),
            ),
          ),
        ],
      )
    );
  }
}