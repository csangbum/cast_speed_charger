import 'dart:async';

import 'package:flutter/material.dart';

import '../../charger_info.dart';

class StatusBarWidget extends StatefulWidget {
  StatusBarWidget({super.key, required this.screenCallback});
  late void Function() screenCallback;

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  ChargerInfo chargerInfo = ChargerInfo.getInstance();
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.wifi, color: Colors.white,),
          GestureDetector(
            onTapDown: (_) {
              _timer = Timer(const Duration(seconds: 3), () {
                _showDemoDialog(context);
              });
            },
            onTapUp: (_) {
              _timer?.cancel();
            },
            child: const Icon(Icons.settings_applications, color: Colors.white,),
          ),
        ],),
    );
  }

  void _showDemoDialog(BuildContext context) {
    bool normalModeChecked = !chargerInfo.isDemoMode; // �Ϲ� ��� üũ ����
    bool demoModeChecked = chargerInfo.isDemoMode; // ���� ��� üũ ����

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('��� ����')),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text('�Ϲ� ���'),
                    value: !chargerInfo.isDemoMode,
                    onChanged: (value) {
                      setState(() {
                        normalModeChecked = value!;
                        if (value) {
                          // '�Ϲ� ���'�� ���õǸ� '���� ���'�� ����
                          demoModeChecked = false;
                          chargerInfo.isDemoMode = false;
                        } else {
                          chargerInfo.isDemoMode = true;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('���� ���'),
                    value: chargerInfo.isDemoMode,
                    onChanged: (value) {
                      setState(() {
                        // chargerInfo.isDemoMode = value!;
                        if (value!) {
                          // '���� ���'�� ���õǸ� '�Ϲ� ���'�� ����
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
                Navigator.of(context).pop(); // ���̾�α� �ݱ�
                widget.screenCallback();
              },
              child: Text('���'),
            ),
            TextButton(
              onPressed: () {
                // ���õ� ��忡 ���� ó��
                Navigator.of(context).pop(); // ���̾�α� �ݱ�
                widget.screenCallback();
              },
              child: Text('Ȯ��'),
            ),
          ],
        );
      },
    );
  }
}
