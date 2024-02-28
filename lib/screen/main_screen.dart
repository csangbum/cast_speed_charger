import 'package:flutter/material.dart';
import 'package:test3/charger_info.dart';
import 'package:test3/screen/charger_connect_screen.dart';
import 'package:test3/screen/charging_state_screen.dart';
import 'package:test3/screen/component/status_bar_widget.dart';
import 'package:test3/screen/number_input_dialog.dart';
import 'package:test3/screen/read_card_screen.dart';
import 'package:test3/screen/select_charger_cable.dart';
import 'package:test3/screen/select_pay_card.dart';

import '../constants/cast_color_const.dart';
import 'bottom_info.dart';
import 'component/navigator_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  ChargerInfo chargingStatus = ChargerInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CastProColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StatusBarWidget(),
          Expanded(
            // fit: FlexFit.tight,
            // child: SelectPayCardScreen(),
            child: IndexedStack(
              index: getPageIndex(), // 현재 보여줄 위젯의 인덱스
              children: const [
                SelectChargerCable(),
                SelectPayCardScreen(),
                ReadCardScreen(),
                ChargerConnectScreen(),
                ChargingStateScreen(),
              ],
            )
            // ChargingStateScreen(),
          ),
          NavigatorWidget(screenCallback: refreshScreen),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Divider(color: CastProColor.dividerColor,height: 5,),
          ),
          const BottomInfo(),
        ],
      ),
    );
  }

  void goToHome() {
    Navigator.of(context).pop();
  }

  void refreshScreen() {
    setState(() {
      print('csangbum refreshScreen');
    });
  }

  int getPageIndex() {
    int index = 0;
    switch (chargingStatus.chargingStatus) {
      case ChargingStatus.selectCable:
        index = 0;
        break;
      case ChargingStatus.selectPayment:
        index = 1;
        break;
      case ChargingStatus.readCard:
        index = 2;
        break;
      case ChargingStatus.connectCable:
        index = 3;
        break;
      case ChargingStatus.charging:
        index = 4;
        break;
      case ChargingStatus.chargingComplete:
        index = 5;
        break;
      default:
        index =  0;
        break;
    }
    return index;
  }
}
