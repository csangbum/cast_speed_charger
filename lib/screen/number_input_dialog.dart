import 'package:flutter/material.dart';

class NumberInputDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _NumberDialog();
      },
    );
  }
}

class _NumberDialog extends StatefulWidget {
  @override
  _NumberDialogState createState() => _NumberDialogState();
}

class _NumberDialogState extends State<_NumberDialog> {
  String inputNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // 각지게 만들기
      ),
      title: Center(
        child:  RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: '결재하실 ',
            style: TextStyle(color: Colors.black, fontSize: 15),
            children: <TextSpan>[
              TextSpan(
                text: '충전금액',
                style: TextStyle(color: Colors.blue, fontSize: 15), // 파란색으로 스타일링
              ),
              TextSpan(
                text: '을 입력하세요.',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const Text(
                '충전금액',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),
              Text(
                textAlign: TextAlign.left,
                inputNumber.isEmpty? '0 원' : '$inputNumber 원',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 5,),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('1', setState),
                  _buildNumberButton('2', setState),
                  _buildNumberButton('3', setState),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('4', setState),
                  _buildNumberButton('5', setState),
                  _buildNumberButton('6', setState),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('7', setState),
                  _buildNumberButton('8', setState),
                  _buildNumberButton('9', setState),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 64), // 빈 공간
                  _buildNumberButton('0', setState),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        inputNumber = '';
                      });
                    },
                    child: const Text('Clear', style: TextStyle(color: Colors.black),),
                  ),
                const SizedBox(height: 30), // 빈 공간
                ],
              ),
            ],
          );
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent, backgroundColor: Colors.white, // 글씨색
              ),
              onPressed: () {
                Navigator.of(context).pop(); // 취소 버튼
              },
              child: const Text('취소'),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // 글씨색
              ),
              onPressed: () {},
              child: Text('확인'),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number, StateSetter setState) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          inputNumber += number;
        });
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide.none, // 테두리 효과 없앰
        // shadowColor:
      ),
      child: Text(number, style: const TextStyle(color: Colors.black),),
    );
  }
}
