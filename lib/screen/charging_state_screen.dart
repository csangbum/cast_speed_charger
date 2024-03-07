import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../charger_info.dart';
import '../utils/utils.dart';
import 'component/custom_dialog.dart';

class ChargingStateScreen extends StatefulWidget {
  ChargingStateScreen({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<ChargingStateScreen> createState() => _ChargingStateScreenState();
}

class _ChargingStateScreenState extends State<ChargingStateScreen> {
  final int ch1ElpsedTime = 0;
  final int ch2ElpsedTime = 40;
  final int ch1ChargingTime = 50;
  final int ch2ChargingTime = 60;
  final int ch1ChargingEndTime = 4000;
  final int ch2ChargingEndTime = 2000;
  ChargingController controller = ChargingController();
  final double orSizeRatio = 355/1080*100;
  final Color cyanColor = const Color(0xff09C5CC);

  @override
  Widget build(BuildContext context) {
    final double orWidth = Utils.getHorizonSize(orSizeRatio, context);
    double stopBtnWidth = Utils.getHorizonSize((248 / 1080 * 100), context);

    // if (controller.getChargerState(1) != ChargerState.charging
    //     && controller.getChargerState(2) != ChargerState.charging) {
    //   Navigator.of(context).pop();
    //   print('csangbum 2ch is not charging state');
    //   return const SizedBox(width: 100, height: 200, child: Text('hi', style: TextStyle(color:Colors.white),),);
    // }
    print('csangbum 2ch is not charging ch1 ${controller.getChargerState(1)} ch2 ${controller.getChargerState(2)}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        controller.getChargerState(1) == ChargerState.charging ?
        Stack(
          children: [
            const Image(image: AssetImage('assets/left_charge_screen.png'),
                filterQuality: FilterQuality.high,),
            Positioned(
              top: 80,
              left: 115,
              child: getTimeWidget(0,true),
            ),
            Positioned(
              top: 113,
              left: 115,
              child: getTimeWidget(0,true),
            ),
            Positioned(
              top: 148,
              left: 115,
              child: getTimeWidget(4000,false),
            ),
            Positioned(
              right:30,
              top:65,
              child: CircularPercentIndicator(
                radius: 55.0, // 원형 진행 바의 반지름
                lineWidth: 18.0, // 진행 바의 두께
                percent: 0.7, // 진행 값 (0.0부터 1.0까지)
                center:
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '충전속도',
                        style: TextStyle(color: Colors.white, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 13), // "진행" 텍스트의 색상을 파랑색으로 설정
                      ),
                      TextSpan(
                        text: '\n  70',
                        style: TextStyle(color: cyanColor, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 18, fontWeight: FontWeight.bold), // "70%" 텍스트의 색상을 검정색으로 설정
                      ),
                      TextSpan(
                        text: '%',
                        style: TextStyle(color: cyanColor, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 13, fontWeight: FontWeight.bold), // "70%" 텍스트의 색상을 검정색으로 설정
                      ),
                    ],
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round, // 진행 바의 모양 설정
                backgroundColor: const Color(0xff112f39), // 배경 색상
                progressColor: Colors.blue, // 진행 바 색상
             ),
            ),
            const Positioned(
              top: 224,
              left: 55,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('4.52 kw/h'),
              ),
            ),
            const Positioned(
              top: 224,
              right: 60,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('2,800 원'),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 150,
              child: SizedBox(
                height: 35,
                child:
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(okClickCallback: () {
                          print('charger state');
                          controller.setChargerState(1, ChargerState.ready);
                          if (controller.getChargerState(1) != ChargerState.charging && controller.getChargerState(2) != ChargerState.charging) {
                            controller.setStatus(ChargingStatus.selectCable);
                          }
                          setState(() {
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                          });
                          refreshScreen();
                        },); // 위에서 정의한 다이얼로그 사용
                      },
                    );
                  } ,
                  child: const Image(image: AssetImage('assets/stop_btn.png'),
                    filterQuality: FilterQuality.high,),
                ),
              ),
            ),
          ],
        )
        :Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: const Image(image: AssetImage('assets/c_type.png'),
            filterQuality: FilterQuality.high,),
        ),
        controller.getChargerState(1) != ChargerState.charging || controller.getChargerState(2) != ChargerState.charging?
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Image(
          image: AssetImage('assets/OR.png'),
          // width: orWidth,
            filterQuality: FilterQuality.high,
          ),)
          :const SizedBox(height: 10,),
        controller.getChargerState(2) != ChargerState.charging ?
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: const Image(image: AssetImage('assets/b_type.png'),
            filterQuality: FilterQuality.high,),
        ):
        Stack(
          children: [
            const Image(image: AssetImage('assets/right_charge_screen.png'),
              filterQuality: FilterQuality.high,),
            Positioned(
              top: 80,
              left: 115,
              child: getTimeWidget(0,true),
            ),
            Positioned(
              top: 113,
              left: 115,
              child: getTimeWidget(0,true),
            ),
            Positioned(
              top: 148,
              left: 115,
              child: getTimeWidget(4000,false),
            ),
            Positioned(
              right:30,
              top:65,
              child: CircularPercentIndicator(
                radius: 55.0, // 원형 진행 바의 반지름
                lineWidth: 18.0, // 진행 바의 두께
                percent: 0.4, // 진행 값 (0.0부터 1.0까지)
                center:
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: '충전속도',
                        style: TextStyle(color: Colors.white, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 13), // "진행" 텍스트의 색상을 파랑색으로 설정
                      ),
                      TextSpan(
                        text: '\n  40',
                        style: TextStyle(color: cyanColor, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 18), // "70%" 텍스트의 색상을 검정색으로 설정
                      ),
                      TextSpan(
                        text: '%',
                        style: TextStyle(color: cyanColor, fontFamily: GuiConstants.fontFamilyNoto, fontSize: 13, fontWeight: FontWeight.bold), // "70%" 텍스트의 색상을 검정색으로 설정
                      ),
                    ],
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round, // 진행 바의 모양 설정
                backgroundColor: const Color(0xff112f39), // 배경 색상
                progressColor: Colors.blue, // 진행 바 색상
              ),
            ),
            const Positioned(
              top: 224,
              left: 55,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('4.52 kw/h'),
              ),
            ),
            const Positioned(
              top: 224,
              right: 60,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GuiConstants.fontFamilyNoto,
                ),
                child: Text('2,800 원'),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 150,
              child: SizedBox(
                height: 35,
                child:
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(okClickCallback: () {
                          print('charger state');
                          controller.setChargerState(2, ChargerState.ready);
                          if (controller.getChargerState(1) != ChargerState.charging && controller.getChargerState(2) != ChargerState.charging) {
                            controller.setStatus(ChargingStatus.selectCable);
                          }
                          setState(() {
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                          });
                          refreshScreen();
                        },); // 위에서 정의한 다이얼로그 사용
                      },
                    );
                  } ,
                  child: const Image(image: AssetImage('assets/stop_btn.png'),
                    filterQuality: FilterQuality.high,),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getTimeWidget(int time, bool bIncrease) {
    return bIncrease? _ChargedTimeUp(preset:time, updateScreen: () {  },): _ChargedTimeDown(preset:time, updateScreen: () {  },);
  }

  void refreshScreen() {
    setState(() {
      print('csangbum refreshScreen');
    });
  }
}

class _ChargedTimeUp extends StatefulWidget {
  int preset;
  VoidCallback updateScreen;
  _ChargedTimeUp({Key? key, required this.preset, required this.updateScreen})
      : super(key: key);

  @override
  State<_ChargedTimeUp> createState() => _ChargedTimeUpState();
}

class _ChargedTimeUpState extends State<_ChargedTimeUp> {
  late StopWatchTimer stopWatchTimer;
  final Color cyanColor = const Color(0xff09C5CC);

  @override
  void initState() {
    super.initState();
    Utils.logMsg('initState StopWatchTimer???? preset ${widget.preset}');
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
    );
    stopWatchTimer.setPresetSecondTime(widget.preset);
    stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: stopWatchTimer.rawTime.value,
      builder: (context, snapshot) {
        final value = snapshot.data!;

        final displayTime = StopWatchTimer.getDisplayTime(value, milliSecond: false);
        return Text(
          displayTime,
          textAlign: TextAlign.right,
          style: TextStyle(color: cyanColor, fontSize: 14, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700),
        );
      },
    );
  }

  @override
  void dispose() {
    Utils.logMsg('dispose stop watch timer');
    stopWatchTimer.onStopTimer();
    stopWatchTimer.dispose();
    super.dispose();
  }
}


class _ChargedTimeDown extends StatefulWidget {
  int preset;
  VoidCallback updateScreen;
  _ChargedTimeDown({Key? key, required this.preset, required this.updateScreen})
      : super(key: key);

  @override
  State<_ChargedTimeDown> createState() => _ChargedTimeDownState();
}

class _ChargedTimeDownState extends State<_ChargedTimeDown> {
  late StopWatchTimer stopWatchTimer;
  final Color cyanColor = const Color(0xff09C5CC);

  @override
  void initState() {
    super.initState();
    Utils.logMsg('_ChargedTimeDown initState StopWatchTimer????');
    stopWatchTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        onChange:  (int count) {
          int sec = StopWatchTimer.getRawSecond(count);
          if (sec <=0) {
            stopWatchTimer.onStopTimer();
            Future.delayed(const Duration(seconds: 2), (){
              widget.updateScreen();
            });
          }
        }
    );
    stopWatchTimer.setPresetSecondTime(widget.preset);
    stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: stopWatchTimer.rawTime.value,
      builder: (context, snapshot) {
        final value = snapshot.data!;
        final displayTime =
        StopWatchTimer.getDisplayTime(value, milliSecond: false);
        return Text(
          displayTime,
          textAlign: TextAlign.right,
          style: TextStyle(color: cyanColor, fontSize: 14, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700),
        );
      },
    );
  }

  @override
  void dispose() {
    Utils.logMsg('dispose stop watch timer');
    stopWatchTimer.onStopTimer();
    stopWatchTimer.dispose();
    super.dispose();
  }

}
