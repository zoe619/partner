import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/state/broadcast.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/expandable_container.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/live_kitchen.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PreLiveKitchenScreen extends StatefulWidget {
  @override
  _PreLiveKitchenScreenState createState() => _PreLiveKitchenScreenState();
}

class _PreLiveKitchenScreenState extends State<PreLiveKitchenScreen> {
  final _users = <int>[];
  RtcEngine _engine;
  bool muted = false;
  int streamId;
  final _infoStrings = <String>[];
  bool isLive;

  // final Broadcast _broadcast = Get.put(Broadcast());

  Future broadCast() async {
    var title = broadcastValues['title'];
    var online = broadcastValues['isOnline'];
    var price = int.parse(broadcastValues['price']);
    var option = broadcastValues['option'];
    var image = broadcastValues['image'];

    final uri =
        "https://demoapi.travtubes.com/api/v1/livestream/broadcast/start_stream";
    final response = await http.post(Uri.parse(uri),
        body: json.encode({
          'stream_title': title,
          'online_order': online,
          'price': price,
          'options': {'delivery_means': option.toString().toLowerCase()},
          // 'image': image
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MTRlNTc0ZC01YWYwLTRiNDEtYTljMy1jNTJjMjY2ZGI4MTgiLCJqdGkiOiJjMWM2Y2U4OTJmNTQ1ZWQwM2EyOTYwNDdlOWJiNTY3YTJlMGJiNGE4ZTIwMGNmY2I0MGM3YWIzYTViMzM5Zjk0YTA5YWFhNTkyOGMxMzM4OCIsImlhdCI6MTYzMDM0NDIzNywibmJmIjoxNjMwMzQ0MjM3LCJleHAiOjE2NjE4ODAyMzcsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.VKFBiwWtlJ4SZJDCUp25ntURYrDTn74We19mj8aac--K75yCv3AhamN_t0H9nOSFiBUHTxccDRgi4_NIqNnxzTLU3Dqc27Bluf-g6Uvkx0-DSb8MbOlpenMr6V7CVZW2mOTt9UMlwFxnO8Qy_G-geLBZVdzqTmBHYpIsGCnRjCTrZZOYMqfA9LO4QDciTl_Xi6KuBgkDqg1h9bTZNtwXgfiHPehwE4-ndYS7jZzy7VDjVC8zBCm17tQMTkAZnZJ0LSsmMj6wgmIIPPH-tWgjEMmCp6bLI7aDwqZs4qtYuX3jU_l8joec3xzNO_9ryiz0a1HB9jjXsaIHQKBohUtA9xD_yXP57xG7KWZbiWUgFaC7iARmK23jsj61--19YOD3dd6lAI7ZY4BbXfJKvo-u_MJN3rBqKY4O64uKAo6bCv19fMuvQ8TFIpjKnzggSJFDTGyngtB5uyUdNJRJqEcH8e9rrGV6pBKu9cMs0j-p6cugP6skVh3o5yOrWRELFrOEmmLkO_HSekznlfYI5C4hTe7KhENcoZy11Y0k23XQZV_UjDwsXr2azwJ5th5sTO-qV1txa3zM3M4_yuObOXGxs-R5Hx2UrVmKQD5wI_hzZEBxGidC_rggxBYr6eLhtd8TPN4qhc16NzikWkEyPdrwUp2FIQ_yDA7uYCaWKQKSCFU'
        });
    final rBody = json.decode(response.body);
    print('RESPONSE $rBody');

    responseValues["channelId"] = rBody['data']['current_channel'];
    responseValues["channelName"] = rBody['data']['channel_title'];
    responseValues["userId"] = rBody['user'];
    responseValues["token"] = rBody['token'];
    responseValues["image"] = rBody['data']['image'];

    _engine.destroy();

    Get.to(LiveKitchenScreen());

    print(
        "TEST BROADCAST $title, $online, $price, $option ${responseValues["token"]}");
  }

  @override
  void dispose() {
    _users.clear();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeAgora();
    isLive = false;
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
        setState(() {
          final info = 'onJoinChannel: $channel, uid: $uid';
          _infoStrings.add(info);
          print("Agora Join Channel Success $info");
        });
      },
      leaveChannel: (stats) {
        setState(() {
          _infoStrings.add('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          final info = 'userJoined: $uid';
          _infoStrings.add(info);
          _users.add(uid);
          print("Agora User Joined $info");
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

    await _engine.joinChannel(null, 'pre_live_channel', null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.createWithConfig(
        RtcEngineConfig("7c8c675b31a34db3b6d1c73bcf570a60"));

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
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.3,
              child: ExpandableContainer()),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.4,
              bottom: 30,
              child: InkWell(
                  onTap: () {
                    // broadCast();
                  },
                  child: GoLiveButton()))
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

class GoLiveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      child: Text(
        'Go Live',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(252, 6, 6, 0.7),
      ),
    );
  }
}
