import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  final VoidCallback onEnd;
  final int duration;
  final TextStyle textStyle;
  const TimerComponent({Key key, this.onEnd, this.duration, this.textStyle}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  @override
  Widget build(BuildContext context) {
    print('widget.duration ${widget.duration}');
    //int _time = widget.duration;
    List<int> list = [00, 59, 58, 57, 56, 55, 54, 53, 52, 51,
      50, 49, 48, 47, 46, 45, 44, 43, 42, 41,
      40, 39, 38, 37, 36, 35, 34, 33, 32, 31,
      30, 29, 28, 27, 26, 25, 24, 23, 22, 21,
      20, 19, 18, 17, 16, 15, 14, 13, 12, 11,
      10, 9, 8, 7, 6, 5, 4, 3, 2, 1,
    ];
    int _time = 0;

    if(widget.duration < 0){
      _time = int.parse('${widget.duration}'.replaceAll('-', ''));
    }

    return Container(
      child: TweenAnimationBuilder<Duration>(
        duration: Duration(seconds: _time),
        tween: Tween(begin: Duration(seconds: widget.duration), end: Duration.zero),
        onEnd: widget.onEnd,
        builder: (BuildContext context, Duration value,  child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Text(
            '$minutes:${list[seconds]}'.replaceAll('-', ''),
            textAlign: TextAlign.center,
            style: widget.textStyle,
          );
        },
      ),
    );
  }
}
