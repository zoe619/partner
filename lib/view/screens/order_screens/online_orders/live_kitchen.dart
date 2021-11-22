import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:order_tracker/state/broadcast.dart';

import 'package:order_tracker/view/screens/order_screens/online_orders/expandable_container.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:http/http.dart' as http;
import 'package:order_tracker/view/screens/order_screens/online_orders/pre_live_kitchen.dart';

class LiveKitchenScreen extends StatefulWidget {
  // final channelId;
  // final channelName;
  // final userId;
  // final token;
  // LiveKitchenScreen(this.channelId, this.channelName, this.userId, this.token);
  @override
  _LiveKitchenScreenState createState() => _LiveKitchenScreenState();
}

class _LiveKitchenScreenState extends State<LiveKitchenScreen> {
  final _users = <int>[];
  RtcEngine _engine;
  bool muted = false;
  int streamId;
  final _infoStrings = <String>[];
  bool isLive;

  @override
  void dispose() {
    _users.clear();
    _engine.destroy();
    super.dispose();
  }

  Future stopLiveKitchen() async {
    final response = await http.post(
        Uri.parse(
            "https://demoapi.travtubes.com/api/v1/livestream/broadcast/end_stream"),
        body: json.encode({"channel_id": "${responseValues["channelId"]}"}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MTRlNTc0ZC01YWYwLTRiNDEtYTljMy1jNTJjMjY2ZGI4MTgiLCJqdGkiOiJiOGIxNzk3ZWE5OWYyN2MyYTA5YTVjM2Y0NmRmM2IzYmUzMjU0MTg3ZmFjNjJhZDgxZTdhZTVhYzYzNDYxZTBhNWI5NDE5MDU4ZGE2OWQ0OCIsImlhdCI6MTYzMDMwOTUyOSwibmJmIjoxNjMwMzA5NTI5LCJleHAiOjE2NjE4NDU1MjksInN1YiI6IjEiLCJzY29wZXMiOltdfQ.G-zG3wd6yC3OF7m2MNY1Whap8_1wWm9MssxDL0KGQNetqDuy57xwG3s0pmPBr6vRDViGAqG1yt1Li5l3ewo3fa46QOw9i4oZCqbgC5VVvbBKT5Go-Cg3SZZVw9sh6yUOZ5dGAkCDvqp-Et-snpq2f5_b3F8YnKsDE_y1wqfubljKS-UDnpn8eKvoL8lW4_JrJVYNZR9IMOZkS5L5hNawXT167p8OvqEN-ZazguroB3UCj8yYZpRxcWh8iHKJYCrMSLm5MxbmnnpoAA8L2YFj-HiJWWQ_Snky6cETodEcTeRmkfWwNUl0_eRnSNYX5vwoGr9jnkPk-hdG3h6l_GM-BExKBjWRGtycnccd-xVjkoL-sT8wcCS-3OzyjkrZZeGOHXXdwtGbM2lXWmkRpME79ezsNOrBvbKcdBk_pHShVrIAFRvF7VCBBOW_QQl4zqIhQ6vlpiDaWP7QWJagKf6yMhDuj4asDZm5ASbgcXY0WTqqf1rYmiisQYjM3v82k54kUacRddkiwkuvyTrFn31EH82c0EpGP-6z22hv5vAHIfQVX1YdyXyttUeRNGzM68nSm0F3WhGUVRuCOBigC1N6eEo49YGhtLPuKgSbBvV_TQQ6lwcTm8x6Xe2rhIIEeLTIybMPMu6ApjHP3xvnTDTu1JWpQI9O44Jw4HxWA85qwZw'
        });

    final rBody = json.decode(response.body);

    print('End Live RESPONSE $rBody');

    Get.to(PreLiveKitchenScreen());
  }

  @override
  void initState() {
    super.initState();

    initializeAgora();
  }

  Future<void> initializeAgora() async {
    await _initAgoraRtcEngine();

    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        setState(() {
          final info = 'onError: $code';
          _infoStrings.add(info);
          print("Agora on error $info");
        });
      },
      warning: (code) {
        setState(() {
          final info = 'onError: $code';
          _infoStrings.add(info);
          print("Agora on error $info");
        });
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        final info = 'onJoinChannel: $channel, uid: $uid';
        print("Agora Join Channel Success $info");
        setState(() {
          _infoStrings.add(info);
        });
      },
      leaveChannel: (stats) {
        setState(() {
          _infoStrings.add('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        final info = 'userJoined: $uid';

        print("Agora User Joined $info");
        setState(() {
          _infoStrings.add(info);
          _users.add(uid);
        });
      },
      userOffline: (uid, elapsed) {
        setState(() {
          final info = 'userOffline: $uid';
          _infoStrings.add(info);
          _users.remove(uid);
        });
      },
    ));

    final channelId = responseValues["channelId"];
    final channelName = responseValues["channelName"];
    final userId = responseValues["userId"];
    final token = responseValues["token"];

    print("USER JOIN $channelId $channelName $token $userId");

    await _engine.joinChannel(token, channelId, null, userId);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.createWithConfig(
        RtcEngineConfig("2524d8ff5c904f87800f6ef1a3e6cf37"));
    await _engine.enableVideo();

    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);

    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  @override
  Widget build(BuildContext context) {
    print("Kitchen Live");

    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          _broadcastView(),
          Positioned(
            child: ViewsAndLive(),
            top: 4,
            right: 4,
          ),
          // Positioned(
          //     right: 0,
          //     bottom: MediaQuery.of(context).size.height * 0.3,
          //     child: ExpandableContainer()),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.4,
              bottom: 30,
              child: InkWell(
                  onTap: () {
                    stopLiveKitchen();
                    _engine.destroy();
                  },
                  child: StopLiveButton()))
        ],
      ),
    ));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    list.add(RtcLocalView.SurfaceView());
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Video view row wrapper
  Widget _expandedVideoView(List<Widget> views) {
    final wrappedViews = views
        .map<Widget>((view) => Expanded(child: Container(child: view)))
        .toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _broadcastView() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]])
          ],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]]),
            _expandedVideoView([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }
}

class StopLiveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      child: Text(
        'Stop Live',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(27, 27, 27, 0.7),
      ),
    );
  }
}

class ViewsAndLive extends StatefulWidget {
  @override
  _ViewsAndLiveState createState() => _ViewsAndLiveState();
}

class _ViewsAndLiveState extends State<ViewsAndLive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {},
            child: Text('Live'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text('Live'),
          ),
          Icon(Mdi.cancel)
        ],
      ),
    );
  }
}
