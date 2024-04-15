import 'dart:async';

import 'package:flutter/material.dart';

import '../../charger_info.dart';
import '../../utils/utils.dart';

class StatusBarWidget extends StatefulWidget {
  StatusBarWidget({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  ChargerInfo chargerInfo = ChargerInfo.getInstance();
  Timer? _timer;
  final double iconSize = (22) / 392*100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.wifi, color: Colors.white, size: Utils.getHorizonSize(iconSize, context),),
            GestureDetector(
              onTapDown: (_) {
                _timer = Timer(const Duration(seconds: 3), () {
                  _showDemoDialog(context);
                });
              },
              onTapUp: (_) {
                _timer?.cancel();
              },
              child: Icon(Icons.settings_applications, color: Colors.white,size: Utils.getHorizonSize(iconSize, context),),
            ),
          ],),
      ),
    );
  }

  void _showDemoDialog(BuildContext context) {
    bool normalModeChecked = !chargerInfo.isDemoMode; // 일반 모드 체크 상태
    bool demoModeChecked = chargerInfo.isDemoMode; // 데모 모드 체크 상태

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('모드 선택')),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text('일반 모드'),
                    value: !chargerInfo.isDemoMode,
                    onChanged: (value) {
                      setState(() {
                        normalModeChecked = value!;
                        if (value) {
                          // '일반 모드'가 선택되면 '데모 모드'는 해제
                          demoModeChecked = false;
                          chargerInfo.isDemoMode = false;
                        } else {
                          chargerInfo.isDemoMode = true;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('데모 모드'),
                    value: chargerInfo.isDemoMode,
                    onChanged: (value) {
                      setState(() {
                        // chargerInfo.isDemoMode = value!;
                        if (value!) {
                          // '데모 모드'가 선택되면 '일반 모드'는 해제
                          chargerInfo.isDemoMode = true;
                        } else {
                          chargerInfo.isDemoMode = false;
                        }
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                widget.screenCallback();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                // 선택된 모드에 대한 처리
                Navigator.of(context).pop(); // 다이얼로그 닫기
                widget.screenCallback();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
