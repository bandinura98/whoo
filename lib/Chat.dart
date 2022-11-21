import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whoo/page_which_goes_chat_page.dart';
import 'package:whoo/utils.dart';



  IO.Socket _socket;

  String myid = "vely";
  String content = "my contenterino";




List<int> Clist=[];




  Future _wsql(String str) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: '165.22.75.147',
        port: 3306,
        user: 'admin_strategy',
        db: 'admin_strategy',
        password: 'web123'));

    var result = await conn.query(
        'insert into old_chats (costumer_id, worker_id, message, flag) values (?,?,?,?);',
        [31, 2, "$str",0]);
    print('Inserted row id=${result.insertId}');



  }
class Chat extends StatefulWidget {

  @override
  _Chat createState() => _Chat();
}


class _Chat extends State<Chat> {


    Future _oldchats() async {

        final conn = await MySqlConnection.connect(ConnectionSettings(
            host: '165.22.75.147',
            port: 3306,
            user: 'admin_strategy',
            db: 'admin_strategy',
            password: 'web123'));

        var results2 = await conn.query(
            'select costumer_id, worker_id, message, flag from old_chats where worker_id=? and costumer_id = ?', [chid, 31]);
        print("test : ${results2.toString()}");
        Clist = [];
        for (var row in results2) {
          print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
          strlist.add(row[2]);
          Clist.add(row[3]);
        }
        return true;
        //return strlist;
      }


    @override
  void initState() {

    // TODO: implement initState
      _socket = IO.io('http://194.71.126.71:3000', <String, dynamic>{
        'transports': ['websocket'],
        'forceNew': true
      });
      _socket.connect();


      super.initState();

  }
  @override
  Widget build(BuildContext context) {


    messageList= strlist;
    //print(messageList);
    print(Clist);
    print(" chid $chid");
    //print(strlist);

    _socket.on("connect", (skt) {
      print('Connected');
      //_socket.id="1";//Ahu için hen hüz deneme
      _socket.emit('rname',"$chid ${_socket.id}");

      _socket.on('out_msg', (response) {
        print("soketten gelen : $response");
 
      });

    });

    final myController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: FutureBuilder(
        future: _oldchats(),
        builder: (context, snapshot) {
          if(snapshot.hasData == false) return Center(child: CircularProgressIndicator(),);
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text("${this.messageList[index]}"),
                        color: cs(this.colorlist[index]),
                      );
                    }),
                Align(alignment: Alignment.bottomCenter,
                  child: SizedBox(height: 50, child: TextFormField(
                    controller: myController,
                  ),),)
                ,
              ],
            ),

          );
        }
      ),
      floatingActionButton: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
        ),
        onPressed: (){
          String ss = myController.text;
          /*
          this.setState(() {
            this.messageList.add(/*0,*/ss);
            this.colorlist.add(0);
          });
          */
          _wsql(ss);
          //insert
          myController.text = "";
          _socket.emit('hello', "$ss");

        },
      ),
    );
  }
  
  Widget buildChatRow()
}
