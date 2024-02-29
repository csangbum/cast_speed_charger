import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

class InputPhoneNumberDialog extends StatefulWidget {
  InputPhoneNumberDialog({super.key, required this.okClickCallback});
  late void Function() okClickCallback;

  @override
  _InputPhoneNumberDialogState createState() => _InputPhoneNumberDialogState();
}

class _InputPhoneNumberDialogState extends State<InputPhoneNumberDialog> {
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
        width: MediaQuery.of(context).size.width-100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center, // 중앙 정렬
                  child: RichText(
                    textAlign: TextAlign.center,
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
                    //textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                  ),
                ),
                const SizedBox(height: 15,),
                const Text('휴대폰 번호', style: TextStyle(fontSize: 10),textAlign: TextAlign.left,),
                TextField(
                  style: const TextStyle(fontSize: 28, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: '-없이 번호입력',
                    //labelText: '휴대폰 번호',
                  ),
                ),],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('00'),
                        buildButton('0'),
                        buildButton('del'),
                      ],
                    )
                  ],
                )
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
                Navigator.of(context).pop(); // 다이얼로그 닫기
                widget.okClickCallback();
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
            if (text == 'del') {
              phoneNumber = '';
            } else {
              phoneNumber += text;
            }
            textEditingController.text = phoneNumber;
          });
        },
        // style: TextButton.styleFrom(
        //   foregroundColor: Colors.black,
        //   textStyle: const TextStyle(fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
        // ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
          const Size(70, 60),)), // 원하는 너비와 높이로 설정
        child: Text(text, style: const TextStyle(fontSize: 28, fontFamily: GuiConstants.fontFamilyNoto, color: Colors.black),));
  }
}

