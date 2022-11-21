
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:whoo/live_stream.dart';
import 'package:whoo/random_chat_page.dart';
import 'package:whoo/register.dart';
import 'package:whoo/utils.dart';
import 'package:mysql1/mysql1.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPage createState() => _LoginPage();
}

TextEditingController mailctr = TextEditingController();
TextEditingController pwdctr = TextEditingController();

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Utils.Red,
            Utils.DarkRed,
            Utils.BoldDarkRed,
            Colors.black
          ], stops: [
            0.1,
            0.5,
            0.7,
            0.9
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lütfen oturum açın veya giriş yapın",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Utils.ThinRed),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    TextField(
                      controller: mailctr,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText: "E-Posta Adresi",
                          labelText: "E-Posta Adresi"),
                    ),
                    TextField(
                      controller: pwdctr,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Parola",
                          labelText: "Parola",

                          icon: Icon(Icons.lock)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue[900],
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.blue[100]),
                      ),
                      onPressed: () {
                        _dbNonAsync(mailctr, pwdctr ,context);
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RandomChatPage()));*/
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.yellow[700],
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(color: Colors.yellow[100]),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                    ),
                  ),
                ],
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () => {},
                text: "Facebook ile Devam Et",
              ),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () => {},
                text: "Google ile Devam Et",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future _dbNonAsync(mail,pwd, BuildContext context) async{
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '165.22.75.147',
      port: 3306,
      user: 'admin_strategy',
      db: 'admin_strategy',
      password: 'web123'
  )
  );
print("aaaa");

  String b = mail.text;
  String c = pwd.text;

  int myint = int.parse(c);

  var result = await conn.query('select email from users_whoo where email = ? and pwd = ?', [ b, myint]);



  print(result.length);

  //print("result =  $result num =  $num");

  if(result.length!=0){

    print("equalizer is ok");
    await conn.close();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RandomChatPage()));
  }
}
