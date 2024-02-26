import 'package:flutter/material.dart';
import 'package:test3/screen/charging_state_screen.dart';
import 'package:test3/screen/component/status_bar_widget.dart';
import 'package:test3/screen/number_input_dialog.dart';

import '../constants/cast_color_const.dart';
import 'component/navigator_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StatusBarWidget(),
          const Expanded(
            // fit: FlexFit.tight,
            child: ChargingStateScreen(),
          ),
          const NavigatorWidget(),
          const Divider(color: CastProColor.dividerColor,height: 5,),
          ElevatedButton(
            onPressed: () {
              NumberInputDialog.show(context);
            },
            child: const Text('Confirm'),
          ),
          const SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0),
                        child: Text("U25 - F1.D.1.0_TV_FrimInfo")),
                    // Text("U25 - F1.D.1.0_TV_FrimInfo",
                    //   style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0),),
                    SizedBox(height: 3,),
                    DefaultTextStyle(
                        style: TextStyle(color: Colors.white, fontSize: 15, height: 1.0),
                        child: Text("ID : CP0001")),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0),
                        child: Text("고객센터 070-4855-2090")),
                    Image(
                      image: AssetImage('assets/castpro_logo.png'),
                      width: 150,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
