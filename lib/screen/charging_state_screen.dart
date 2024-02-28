import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/utils.dart';

class ChargingStateScreen extends StatefulWidget {
  const ChargingStateScreen({super.key});

  @override
  State<ChargingStateScreen> createState() => _ChargingStateScreenState();
}

class _ChargingStateScreenState extends State<ChargingStateScreen> {
  @override
  Widget build(BuildContext context) {
    double stopBtnWidth = Utils.getHorizonSize((248 / 1080 * 100), context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: '좌측 커넥터 ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: '충전중',
                          style: TextStyle(color: Colors.blue, fontSize: 20), // 파란색으로 스타일링
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
                        center: DefaultTextStyle(
                                  style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
                                  child: Text("70%")),
                        // const Column(
                        //   children: [
                        //     DefaultTextStyle(
                        //         style: TextStyle(color: Colors.white, fontSize: 12),
                        //         child: Text('충전속도')),
                        //     DefaultTextStyle(
                        //         style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
                        //         child: Text("70%")),
                        //   ],
                        // ),
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

                              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, ),
                              child: Text("충전량")),
                          Row(
                            children: [
                              Icon(Icons.flash_on_outlined, color: Colors.cyanAccent),
                              // Text('4.52'),
                              // Text(' kw/h'),
                              SizedBox(width: 10,),
                              DefaultTextStyle(
                                  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                                  child: Text("4.52 kw/h"))
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                              child: Text("충전 금액")),
                          Row(
                            children: [
                              Icon(Icons.money_outlined, color:Colors.cyanAccent),
                              SizedBox(width: 10,),
                              DefaultTextStyle(
                                  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                                  child: Text("10,000 원"))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Image(
                    width: stopBtnWidth,
                    image: const AssetImage('assets/stop_btn.png')
                    ,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: '좌측 커넥터 ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: '충전중',
                          style: TextStyle(color: Colors.blue, fontSize: 20), // 파란색으로 스타일링
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
                            style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
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

                              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0, ),
                              child: Text("충전량")),
                          Row(
                            children: [
                              Icon(Icons.flash_on_outlined, color: Colors.cyanAccent),
                              SizedBox(width: 10,),
                              DefaultTextStyle(
                                  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                                  child: Text("4.52 kw/h"))
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                              child: Text("충전 금액")),
                          Row(
                            children: [
                              Icon(Icons.money_outlined, color:Colors.cyanAccent),
                              SizedBox(width: 10,),
                              DefaultTextStyle(
                                  style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                                  child: Text("10,000 원"))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Image(
                    width: stopBtnWidth,
                    image: const AssetImage('assets/stop_btn.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getTitleAndTime(String title, int time) {
    return Row(
      children: [
        DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontSize: 15),
            child: Text(title)),
        const SizedBox(width: 30,),
        DefaultTextStyle(
            style: const TextStyle(color: Colors.cyanAccent, fontSize: 15),
            child: Text(Utils.getHourFormat(time)),)
      ],
    );
  }
}
