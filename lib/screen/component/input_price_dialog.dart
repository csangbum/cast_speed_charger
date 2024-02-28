import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

class InputPriceDialog extends StatefulWidget {
  const InputPriceDialog({super.key});

  @override
  _InputPriceDialogState createState() => _InputPriceDialogState();
}

class _InputPriceDialogState extends State<InputPriceDialog> {
  String phoneNumber = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // border radius 설정
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width-10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '충전정보 수신을 위한 \r\n',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text: '   휴대폰 번호 11자리',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18),
                      ),
                      TextSpan(
                        text: ' 입력하세요',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // 전체 텍스트 정렬
                ),
                const SizedBox(height: 15,),
                const Text('휴대폰 번호', style: TextStyle(fontSize: 10),),
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: '-없이 번호입력',
                  ),
                ),],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('00'),
                  buildButton('0'),
                  buildButton('지우기'),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            InkWell(
              onTap: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Image(
                image: AssetImage('assets/cancel.png'),
                width: 120,
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                // 확인 버튼 눌렸을 때 동작 추가
              },
              child: const Image(
                image: AssetImage('assets/ok.png'),
                width: 120,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButton(String text) {
    return TextButton(
        onPressed: () {
          print('csangbum inputText = $text');
          setState(() {
            if (text == '지우기') {
              phoneNumber = '';
            } else {
              phoneNumber += text;
            }
            textEditingController.text = phoneNumber;
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        child: Text(text));
  }

  Widget buildButton1(String text) {
    return ElevatedButton(
      onPressed: () {
        print('csangbum inputText = $text');
        setState(() {
          if (text == '지우기') {
            phoneNumber = '';
          } else {
            phoneNumber += text;
          }
          textEditingController.text = phoneNumber;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        side: BorderSide.none,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}

