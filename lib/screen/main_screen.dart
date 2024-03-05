import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test3/charger_info.dart';
import 'package:test3/screen/charger_connect_screen.dart';
import 'package:test3/screen/charging_state_screen.dart';
import 'package:test3/screen/component/status_bar_widget.dart';
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
  ChargerInfo chargerInfo = ChargerInfo.getInstance();
  PageController _pageController = PageController();
  Timer? _timer;
  ChargingController controller = ChargingController();

  @override
  void initState() {
    super.initState();
    // 타이머 시작
    if (ChargerInfo.getInstance().isDemoMode) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        controller.moveToNextState();
        setState(() {
          _pageController.animateToPage(
            getPageIndex(),
            duration: const Duration(milliseconds: 500), // 애니메이션 지속 시간 설정 (선택 사항)
            curve: Curves.ease, // 애니메이션 커브 설정 (선택 사항)
          );
        });
      });
    } else {
      if (_timer!= null && _timer!.isActive) {
        _timer!.cancel();
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CastProColor.backgroundColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatusBarWidget(screenCallback: callback,),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  screenIndex = index;
                });
              },
              children: [
                SelectChargerCable(screenCallback: refreshScreen),
                SelectPayCardScreen(screenCallback: refreshScreen),
                ReadCardScreen(screenCallback: refreshScreen),
                ChargerConnectScreen(screenCallback: refreshScreen),
                ChargingStateScreen(screenCallback: refreshScreen),
              ],
            ),
          ),
          NavigatorWidget(screenCallback: refreshScreen),
          // const Padding(
          //   padding: EdgeInsets.only(bottom: 8.0),
          //   child: Divider(color: CastProColor.dividerColor, height: 5,),
          // ),
          const Padding(
            padding: EdgeInsets.only(top:8.0, bottom: 8),
            child: BottomInfo(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // 페이지 컨트롤러를 dispose 해주어야 합니다.
    super.dispose();
  }

  void goToHome() {
    Navigator.of(context).pop();
  }

  void refreshScreen() {
    _pageController.animateToPage(
      getPageIndex(),
      duration: const Duration(milliseconds: 500), // 애니메이션 지속 시간 설정 (선택 사항)
      curve: Curves.ease, // 애니메이션 커브 설정 (선택 사항)
    );
    setState(() {
      print('csangbum refreshScreen');
    });
  }

  int getPageIndex() {
    int index = 0;
    switch (chargerInfo.chargingStatus) {
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

  void callback() {
    print('csangbum callback ${ChargerInfo.getInstance().isDemoMode}');
    if (ChargerInfo.getInstance().isDemoMode) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        controller.moveToNextState();
        setState(() {
          _pageController.animateToPage(
            getPageIndex(),
            duration: const Duration(milliseconds: 500), // 애니메이션 지속 시간 설정 (선택 사항)
            curve: Curves.ease, // 애니메이션 커브 설정 (선택 사항)
          );
        });
      });
    } else {
      if (_timer!= null && _timer!.isActive) {
        print('csangbum cancel ${ChargerInfo.getInstance().isDemoMode}');
        _timer!.cancel();
      }
    }

  }


}
