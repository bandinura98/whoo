import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mysql1/mysql1.dart';
import 'package:whoo/hobby.dart';
import 'package:whoo/random_chat_page.dart';
import 'package:whoo/utils.dart';
import 'package:http/http.dart' as http;

import 'HobbieSelection.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterSatet createState() => RegisterSatet();
}

TextEditingController namectr = TextEditingController();
TextEditingController mailctr = TextEditingController();
TextEditingController pwdctr = TextEditingController();
TextEditingController pwdctr2 = TextEditingController();
TextEditingController agectr2 = TextEditingController();
//TextEditingController sexctr2 = TextEditingController();
//TextEditingController cityctr2 = TextEditingController();

class RegisterSatet extends State<RegisterPage> {


  final conn = MySqlConnection.connect(ConnectionSettings(
  host: 'localhost',
  port: 3306,
  user: 'root',
  db: 'testdb',
  password: 'secret'));


List<String> ageList = ["18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55"];
List<String> sexList = ["ERKEK","KADIN","belirtmeyi tercih etmiyorum"];
List<String> cityList = ["İstanbul","İzmir","Adana","Edirne","Eskişehir"];






String selectedAge = "18";
String selectedsex = "KADIN";
String selectedcity = "İzmir";


  bool isError = false;



  Future<String> _registerAsync() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Lütfen bekleyin"), CircularProgressIndicator()],
            ),
          );
        });

    try {
      
      Map post = {"t": "register"};
      http.Response response = await http.post(Utils.APIURL,
          body: jsonEncode(post),
          headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
      if (response.statusCode == 200) {
        this.setState(() {
          Navigator.of(context).pop(true);
          print("Gelen : ${response.body}");
          return response.body;
        });
      } else {
        isError = true;
        return "";
      }
    } catch (error) {
      print(error);
      setState(() {
        Navigator.of(context).pop(true);
        this.isError = true;
        return "";
      });
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Text(
                      "Ücretsiz Kayıt Ol",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextField(
                      controller: namectr,
                      decoration: InputDecoration(
                          icon: Icon(Icons.people),
                          hintText: "Adınız ve Soyadınız",
                          labelText: "Adınız ve Soyadınız"),
                    ),
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
                    TextField(
                      controller: pwdctr2,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Parola",
                          labelText: "Parola",
                          icon: Icon(Icons.lock)),
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Yaş")),
                        Expanded(
                          child: DropdownButton(
                              value: selectedAge,
                              onChanged: (val) {
                                this.setState(() {
                                  this.selectedAge = val;
                                });
                              },
                              items: ageList.map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem(child: Text(val), value: val,);
                              }).toList()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Cinsiyet")),
                        Expanded(
                          child: DropdownButton(
                              value: selectedsex,
                              onChanged: (val) {
                                this.setState(() {
                                  this.selectedsex = val;
                                });
                              },
                              items: sexList.map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem(child: Text(val), value: val,);
                              }).toList()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Sehir")),
                        Expanded(
                          child: DropdownButton(
                              value: selectedcity,
                              onChanged: (val) {
                                this.setState(() {
                                  this.selectedcity = val;
                                });
                              },
                              items: cityList.map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem(child: Text(val), value: val,);
                              }).toList()),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(child: Text("Hobiler")),
                        Expanded(
                          child: DropdownButton(
                              value: selectedcity,
                              onChanged: (val) {
                                this.setState(() {
                                  this.selectedcity = val;
                                });
                              },
                              items: cityList.map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem(child: Text(val), value: val,);
                              }).toList()),
                        ),
                      ],
                    ),




                  ],
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text("Kaydı Tamamla"),
                onPressed: () {
                  _dbNonAsync(namectr,mailctr,pwdctr,pwdctr2,selectedAge,selectedsex,selectedcity,context);
                  //_registerAsync();
                },
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

Future _dbNonAsync(name,mail,pwd,pwd2,age,sex,city, BuildContext context) async{
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '165.22.75.147',
      port: 3306,
      user: 'admin_strategy',
      db: 'admin_strategy',
      password: 'web123'
    )
  );
print('$age');
print('$sex');
print('$city');

  String sname = name.text;
  String smail = mail.text;
  String spwd = pwd.text;
  String spwd2 = pwd2.text;


  int iage = int.parse(age);
  int isex ;//= int.parse(sex);
  if(sex=="KADIN") isex=1;
  else if(sex=="ERKEK") isex=0;

  if(spwd==spwd2){
    
        var result = await conn.query(
        'insert into users_whoo (name, email, pwd, age, SEX, city) values (?, ?, ?, ?, ?, ?)',
        ['$sname', '$smail', '$spwd', '$iage', '$isex', '$city']);
        if(isex==0) print("müşteri kaydı başarılı");
        if(isex==1) print("çalışan kaydı başarılı");
        //print(iage);
        await conn.close();
        Navigator.push(
            context,
            MaterialPageRoute(
                //builder: (context) => RandomChatPage()));
                builder: (context) => HobbieSelection()));
  }
}
