import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:permission_handler/permission_handler.dart';
import 'package:whoo/utils.dart';

class ShowMePage extends StatefulWidget {
  @override
  ShowMePageState createState() => ShowMePageState();
}

class ShowMePageState extends State<ShowMePage> {
  bool _joined = false;
  int _remoteUid = null;
  bool _switch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatform();
  }

  initPlatform() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
    var engine = await RtcEngine.create(Utils.APP_ID);
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print('joinChannelSuccess ${channel} ${uid}');
      setState(() {
        _joined = true;
      });
    }, userJoined: (int uid, int elapsed) {
      print('userJoined ${uid}');
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline ${uid}');
      setState(() {
        _remoteUid = null;
      });
    }));
  }

  Widget _renderLocalPreview() {
    if (_joined) {
      return RtcLocalView.SurfaceView();
    } else {
      return Text(
        'Please join channel first',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _renderLocalPreview(),
    ));
  }
}
