import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  //! stop_watch_timer method - defining timer object
  // final StopWatchTimer _stopwatchTimer = StopWatchTimer();
  // final _isHour = false;

  //* Adding new stopwatch method
  late Stopwatch stopwatch;
  late Timer t;

  //* Timer value
  String returnFormatedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = ((milli % 1000) ~/ 10).toString().padLeft(2, '0');
    String seconds = (milli ~/ 1000).toString().padLeft(2, '0');
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, '0');

    return '$minutes:$seconds:$milliseconds';
  }

  @override
  void initState(){
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  //! stop_watch_timer method - disposing
  // @override
  // void dispose(){
  //   super.dispose();
  //   _stopwatchTimer.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildTime(),
      ),
    );
  }

  Widget buildTime(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(),
        SizedBox(height: 20,),
        buildButton(),
      ],
    );
  }

  Widget buildTimeCard() {
    return Container(
      //! Style BOX Container
      //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      // decoration: BoxDecoration(
      //   color: Colors.black,
      //   borderRadius: BorderRadius.circular(10),
      // ),

      child: Text(
        returnFormatedText(), 
        style: TextStyle(
          fontFamily: 'Fira Sans', fontSize: 150, fontFeatures: [FontFeature.tabularFigures(),],
        ),
      ),

      //! stop_watch_timer method - Stream builder
      // child: StreamBuilder<int>(
      //     stream: _stopwatchTimer.rawTime,
      //     initialData: _stopwatchTimer.rawTime.value,
      //     builder: (context, snapshot) {
      //       final value = snapshot.data;
      //       final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHour);

      //       return Text(
      //         displayTime,
      //         style: TextStyle(fontFamily: 'Fira Sans', fontSize: 120, fontWeight: FontWeight.normal, color: Colors.black),
      //       );
      //     },
      // ),
    );
  }

  //* Button widget for start, pause, and reset
  Widget buildButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        //* Start Button
        ElevatedButton(
          child: Text('START'),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            stopwatch.start();

            //! stop_watch_timer method - Starting timer
            // _stopwatchTimer.onExecute.add(StopWatchExecute.start);
          },
          ),

        SizedBox(
          width: 20,
        ),

        //* Pause Button
        ElevatedButton(
          child: Text('STOP'),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            stopwatch.stop();

            //! stop_watch_timer method - Stoping timer
            // _stopwatchTimer.onExecute.add(StopWatchExecute.stop);
          },
          ),

        SizedBox(
          width: 20,
        ),

        //* Reset Button
        ElevatedButton(
          child: Text('RESET'),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            stopwatch.reset();

            //! stop_watch_timer method - Reseting timer
            // _stopwatchTimer.onExecute.add(StopWatchExecute.reset);
          },
          ),
      ],
    );
  }
}

