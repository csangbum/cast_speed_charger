import 'package:flutter/material.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff2c2c2c), // 변경하고자 하는 배경색
                shape: BoxShape.circle, // 원 모양으로 설정
              ),
              child: IconButton(
                icon:const Icon(Icons.skip_previous_sharp),
                iconSize: 40,
                color: Colors.white,
                onPressed: () {  },
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff2c2c2c), // 변경하고자 하는 배경색
                shape: BoxShape.circle, // 원 모양으로 설정
              ),
              child: IconButton(
                icon:const Icon(Icons.home),
                iconSize: 40,
                color: Colors.white,
                focusColor: Colors.blue,
                onPressed: () {  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
