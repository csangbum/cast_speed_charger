import 'package:flutter/material.dart';

class SelectPayCardScreen extends StatefulWidget {
  const SelectPayCardScreen({super.key});

  @override
  State<SelectPayCardScreen> createState() => _SelectPayCardScreenState();
}

class _SelectPayCardScreenState extends State<SelectPayCardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("결재방식을 선택해 주세요."),
          Row(
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/castpro_logo.png'),
                    width: 150,
                  ),
                  Text("신용카드\r\n삼성페이"),
                ],
              ),
              Column(
                children: [
                  // Image(),
                  Image(
                    image: AssetImage('assets/castpro_logo.png'),
                    width: 150,
                  ),
                  Text("회원카드\r\n환경부카드"),
                ],
              ),
            ],
          ),
        ]
    )
    );
  }
}
