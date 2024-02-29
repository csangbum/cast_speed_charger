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
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '결재하실 ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: '충전금액',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 18),
                  ),
                  TextSpan(
                    text: '을 입력하세요',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              textAlign: TextAlign.center, // 전체 텍스트 정렬
            ),
            const SizedBox(height: 25,),
            Container(
              decoration: const BoxDecoration(color: Color(0xffe0e0e0), borderRadius: BorderRadius.all(Radius.circular(8)),),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('충전단가', style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              // Icon(Icons.money_rounded, color: Colors.cyanAccent,),
                              Image(image: AssetImage('assets/charging_pay_icon.png'), width: 12,),
                              SizedBox(width: 4,),
                              Text('100,237',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              Text(' 원'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('충전량', style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/charging_power_icon.png'), width: 12,),
                              SizedBox(width: 4,),
                              Text('4.52', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              Text(' kw/h', style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ]
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                const Text('충전금액', style: TextStyle(fontSize: 10),),
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: '충전금액',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel_outlined, color: Colors.grey,),
                      onPressed: (){
                        setState(() {
                          textEditingController.clear();
                        });
                      },
                    ),
                  ),
                ),],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                      ],
                    ),Row(
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
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 25, fontFamily: GuiConstants.fontFamilyNoto, color: Colors.black),
        ),
        child: Text(text));
  }
}

