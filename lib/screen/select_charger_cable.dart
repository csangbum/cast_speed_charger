import 'package:flutter/material.dart';

class SelectChargerCable extends StatefulWidget {
  const SelectChargerCable({super.key});

  @override
  State<SelectChargerCable> createState() => _SelectChargerCableState();
}

class _SelectChargerCableState extends State<SelectChargerCable> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text("충전을 시작하시려면\r\n충전 방식을 선택해 주세요.",
            style: TextStyle(
            fontSize: 15,color: Colors.white)),
          Image(
            image: AssetImage('assets/c_type_b.png'),
            width: 150,
          ),
          Divider(height: 10,),
          Image(
            image: AssetImage('assets/c_type_b.png'),
            width: 150,
          ),
        ],
      ),
    );
  }
}
