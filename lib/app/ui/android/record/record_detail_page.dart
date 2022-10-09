import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/ui/android/history/my_history_page.dart';
import 'package:how_much_spend_app/app/ui/android/home/index_page.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/place_marker.dart';
import 'package:how_much_spend_app/app/ui/theme/constant.dart';
import 'package:how_much_spend_app/app/ui/theme/utils.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RecordDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.to(
            IndexPage(selectIndex: 4),
            duration: Duration(milliseconds: 400),
            transition: Transition.fade
        );
        return Future<bool>.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () => Get.to(
                IndexPage(selectIndex: 4),
                duration: Duration(milliseconds: 400),
                transition: Transition.fade
            )
          ),
          title: Text("기록", style: TextStyle(color: Colors.black),),
          elevation: 1,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.black,))
          ],
        ),
          body: CountUpTimerPage()
      ),
    );
  }
}class CountUpTimerPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => CountUpTimerPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CountUpTimerPage> {
  final _isHours = true;
  bool isRunning = false;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStop: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
    _stopWatchTimer.fetchStop.listen((value) => print('stop from stream'));
    _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: PlaceMarkerPage(),
            ),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Color.fromRGBO(255, 184, 0, 0.1),
                ),
                constraints: BoxConstraints(
                    minHeight: 130
                ),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(horizontalInside: BorderSide(width: 4, color: Colors.white, style: BorderStyle.solid),
                      verticalInside: BorderSide(width: 4, color: Colors.white, style: BorderStyle.solid)),
                  columnWidths: {
                    0: FixedColumnWidth(60.0),
                    2: FixedColumnWidth(60.0),
                  },
                  children: [
                    TableRow(
                        children: [
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text("거리",style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Aggro',
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text("10 km",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Aggro',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text("시간", style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Aggro',
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: StreamBuilder<int>(
                              stream: _stopWatchTimer.rawTime,
                              initialData: _stopWatchTimer.rawTime.value,
                              builder: (context, snap) {
                                final value = snap.data!;
                                final displayTime =
                                StopWatchTimer.getDisplayTime(value, hours: _isHours);
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        displayTime,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Aggro',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8),
                                    //   child: Text(
                                    //     value.toString(),
                                    //     style: const TextStyle(
                                    //         fontSize: 10,
                                    //         fontFamily: 'Helvetica',
                                    //         fontWeight: FontWeight.w400),
                                    //   ),
                                    // ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text("페이스",style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Aggro',
                                  fontWeight: FontWeight.bold),
                              )
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text("10`1 k/m",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Aggro',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text("칼로리",style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Aggro',
                                  fontWeight: FontWeight.bold),
                              )
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text("300 cal",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Aggro',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]
                    )
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(width: 50,height:50),
                  TextButton(
                      onPressed:() {
                      },
                      child: Text("수고한 나에게 한마디", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    width: 50,
                    height:50
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class _Timer extends StatefulWidget {
//   const _Timer({Key? key}) : super(key: key);
//
//   @override
//   State<_Timer> createState() => __TimerState();
// }
//
// class Ticker {
//   const Ticker();
//   Stream<int> tick({required int ticks}) {
//     return Stream.periodic(Duration(seconds: 1), (x) => ticks - x).take(ticks);
//   }
// }
//
// class __TimerState extends State<_Timer> {
//   late StreamSubscription<int> subscription;
//   int? _currentTick;
//   bool _isPaused = false;
//
//   @override
//   initState() {
//     super.initState();
//     _start(30);
//   }
//
//   void _start(int duration) {
//     subscription = Ticker().tick(ticks: duration).listen((value) {
//       setState(() {
//         _isPaused = false;
//         _currentTick = value;
//       });
//     });
//   }
//
//   void _resume() {
//     setState(() {
//       _isPaused = false;
//     });
//     subscription.resume();
//   }
//
//   void _pause() {
//     setState(() {
//       _isPaused = true;
//     });
//     subscription.pause();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: const BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             child: Text(
//               _currentTick == null ? '' : _currentTick.toString(),
//               style: TextStyle(fontSize: 100, color: Colors.white),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     subscription.cancel();
//                     _start(30);
//                   },
//                   child: const Text('ReStart')),
//               const SizedBox(
//                 width: 20,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     _isPaused ? _resume() : _pause();
//                   },
//                   child: Text(_isPaused ? 'Resume' : 'Stop'))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }