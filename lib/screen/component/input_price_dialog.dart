import 'package:flutter/material.dart';
import 'package:test3/constants/cast_color_const.dart';

class InputPriceDialog extends StatefulWidget {
  InputPriceDialog({super.key, required this.okClickCallback});
  late void Function() okClickCallback;

  @override
  _InputPriceDialogState createState() => _InputPriceDialogState();
}

class _InputPriceDialogState extends State<InputPriceDialog> {
  String phoneNumber = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // border radius 설정
      ),
      child: Stack(
        children: [
          const Image(image: AssetImage('assets/sceen03-1_popup.png')),
          const Positioned(
            top: 80,
            left: 65,
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: GuiConstants.fontFamilyNoto,
              ),
              child: Text('320 원'),
            ),
          ),
          const Positioned(
            top: 80,
            right: 45,
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: GuiConstants.fontFamilyNoto,
              ),
              child: Text('4.62 kw/h'),
            ),
          ),
          Positioned(
            top: 131,
            left: 25,
            child: SizedBox(
              height: 120,
              width: 255,
              child: TextField(
                style: const TextStyle(fontSize: 20, fontFamily: GuiConstants.fontFamilyNoto, fontWeight: FontWeight.w700, color: Colors.black),
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: '충전금액',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel_outlined, color: Colors.grey,),
                    onPressed: (){
                      setState(() {
                        textEditingController.clear();
                      });
                    },),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 180,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 30, // 간격 설정
                    children: [
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                    ],
                  ),
                  Wrap(
                    spacing: 30, // 간격 설정
                    children: [
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                    ],
                  ),
                  Wrap(
                    spacing: 30, // 간격 설정
                    children: [
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                    ],
                  ),
                  Wrap(
                    spacing: 30, // 간격 설정
                    children: [
                      buildButton('00'),
                      buildButton('0'),
                      buildButton('del'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
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
            ),
          ),
        ],
      ),
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
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 25, fontFamily: GuiConstants.fontFamilyNoto, color: Colors.black),
        ),
        child: Text(text));
  }
}

