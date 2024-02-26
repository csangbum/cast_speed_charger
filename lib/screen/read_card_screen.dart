import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReadCardScreen extends StatefulWidget {
  const ReadCardScreen({super.key});

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            'assets/charging.json',
            height: MediaQuery.of(context).size.height > 700 ? 250 : 150,),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: '로밍 / 회원카드를 ',
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text: 'RFID 리더기에 접촉하세요.',
                  style: TextStyle(color: Colors.blue, fontSize: 20), // 파란색으로 스타일링
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          const Text("완충으로 진행되며\r\n충전한 금액만큼 결제됩니다.",
            style: TextStyle(color: Colors.blue, fontSize: 15),),
        ],
      ),
    );
  }
}
