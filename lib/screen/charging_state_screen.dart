import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test3/constants/cast_color_const.dart';

import '../utils/utils.dart';
import 'component/custom_dialog.dart';

class ChargingStateScreen extends StatefulWidget {
  ChargingStateScreen({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<ChargingStateScreen> createState() => _ChargingStateScreenState();
}

class _ChargingStateScreenState extends State<ChargingStateScreen> {
  @override
  Widget build(BuildContext context) {
    double stopBtnWidth = Utils.getHorizonSize((248 / 1080 * 100), context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: '좌측 커넥터 ',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto),
                        children: <TextSpan>[
                          TextSpan(
                            text: '충전중',
                            style: TextStyle(color: Colors.blue, fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto), // 파란색으로 스타일링
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          getTitleAndTime('경과시간', 900),
                          getTitleAndTime('충전시간', 900),
                          getTitleAndTime('남은시간', 900),
                        ]
                      ),
                      Center(
                        child: CircularPercentIndicator(
                          radius: 50.0, // 원형 진행 바의 반지름
                          lineWidth: 15.0, // 진행 바의 두께
                          percent: 0.7, // 진행 값 (0.0부터 1.0까지)
                          center: const DefaultTextStyle(
                                    style: TextStyle(color: Colors.cyanAccent, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto),
                                    child: Text("70%")),
                          circularStrokeCap: CircularStrokeCap.round, // 진행 바의 모양 설정
                          backgroundColor: Colors.grey, // 배경 색상
                          progressColor: Colors.blue, // 진행 바 색상
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                                style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                child: Text("충전량")),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Image(image: AssetImage('assets/charging_power_icon.png'), width: 12,),
                                  SizedBox(width: 10,),
                                  DefaultTextStyle(
                                      style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                      child: Text("4.52 kw/h"))
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                                style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                child: Text("충전금액")),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  // Icon(Icons.money_outlined, color:Colors.cyanAccent),
                                  Image(image: AssetImage('assets/charging_pay_icon.png'), width: 12,),
                                  SizedBox(width: 10,),
                                  DefaultTextStyle(
                                      style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                      child: Text("10,000 원"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('csangbum');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog(); // 위에서 정의한 다이얼로그 사용
                        },
                      );

                    },
                    child: Image(
                      width: stopBtnWidth,
                      image: const AssetImage('assets/stop_btn.png'),
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: '좌측 커넥터 ',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto),
                        children: <TextSpan>[
                          TextSpan(
                            text: '충전중',
                            style: TextStyle(color: Colors.blue, fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto), // 파란색으로 스타일링
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getTitleAndTime('경과시간', 900),
                            getTitleAndTime('충전시간', 900),
                            getTitleAndTime('남은시간', 900),
                          ]
                      ),
                      Center(
                        child: CircularPercentIndicator(
                          radius: 50.0, // 원형 진행 바의 반지름
                          lineWidth: 15.0, // 진행 바의 두께
                          percent: 0.7, // 진행 값 (0.0부터 1.0까지)
                          center: const DefaultTextStyle(
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto),
                              child: Text("70%")),
                          circularStrokeCap: CircularStrokeCap.round, // 진행 바의 모양 설정
                          backgroundColor: Colors.grey, // 배경 색상
                          progressColor: Colors.blue, // 진행 바 색상
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                                style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                child: Text("충전량")),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  // Icon(Icons.flash_on_outlined, color: Colors.cyanAccent),
                                  Image(image: AssetImage('assets/charging_power_icon.png'), width: 12,),
                                  SizedBox(width: 10,),
                                  DefaultTextStyle(
                                      style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                      child: Text("4.52 kw/h"))
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                                style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                child: Text("충전금액")),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Image(image: AssetImage('assets/charging_pay_icon.png'), width: 12,),
                                  SizedBox(width: 10,),
                                  DefaultTextStyle(
                                      style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontFamily: GuiConstants.fontFamilyNoto),
                                      child: Text("10,000 원"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog(); // 위에서 정의한 다이얼로그 사용
                        },
                      );
                    },
                    child: Image(
                      width: stopBtnWidth,
                      image: const AssetImage('assets/stop_btn.png'),
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitleAndTime(String title, int time) {
    return Row(
      children: [
        DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto),
            child: Text(title)),
        const SizedBox(width: 30,),
        DefaultTextStyle(
            style: const TextStyle(color: Colors.cyanAccent, fontSize: 15, fontFamily: GuiConstants.fontFamilyNoto),
            child: Text(Utils.getHourFormat(time)),)
      ],
    );
  }
}
