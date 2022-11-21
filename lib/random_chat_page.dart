import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:video_player/video_player.dart';
import 'package:whoo/utils.dart';
import 'package:http/http.dart' as http;

class RandomChatPage extends StatefulWidget {
  RandomChatPage({Key key}) : super(key: key);
  @override
  _RandomChatPage createState() => _RandomChatPage();
}

class _RandomChatPage extends State<RandomChatPage> {
  VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/tv_effect.mp4");
    _controller.play();
  }

  Future<List<Map<String, String>>> getList() async {
    var response = await http.get("http://api.furkandamar.net/video/");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Map<String, String>> list = [];
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
        child: Center(
          child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                return VideoPlayer(_controller);
              }),
        ),
      ),
    );
  }
}
