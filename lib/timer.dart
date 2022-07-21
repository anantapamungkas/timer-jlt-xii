import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final StopWatchTimer _stopwatchTimer = StopWatchTimer();
  final _isHour = false;

  @override
  void dispose(){
    super.dispose();
    _stopwatchTimer.dispose();
  }

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

      child: StreamBuilder<int>(
          stream: _stopwatchTimer.rawTime,
          initialData: _stopwatchTimer.rawTime.value,
          builder: (context, snapshot) {
            final value = snapshot.data;
            final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHour);

            return Text(
              displayTime,
              style: TextStyle(fontFamily: 'Fira Sans', fontSize: 120, fontWeight: FontWeight.normal, color: Colors.black),
            );
          },
      ),
    );
  }

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
            _stopwatchTimer.onExecute.add(StopWatchExecute.start);
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
          onPressed: () {_stopwatchTimer.onExecute.add(StopWatchExecute.stop);},
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
          onPressed: () {_stopwatchTimer.onExecute.add(StopWatchExecute.reset);},
          ),
      ],
    );
  }
}

