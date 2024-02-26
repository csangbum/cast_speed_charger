import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:test3/screen/main_screen.dart';
import 'package:test3/utils/utils.dart';

import 'constants/cast_color_const.dart';
import 'screen/component/status_bar_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CastProColor.backgroundColor,
      body: InkWell(
        highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트
        splashColor: Colors.transparent, //클릭시 원형 이펙트
        onTap: () {
          Utils.logMsg('clicked');
          print('clicked');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const MainScreen();
          }));

        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const StatusBarWidget(),
              const Image(
                image: AssetImage('assets/castpro_logo.png'),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xff010101),
                    ),
                    child: Lottie.asset(
                      'assets/charging.json',
                      height: MediaQuery.of(context).size.height > 700 ? 250 : 150,),
                  ),
              ),
              const Text(
                '화면을 터치해주세요!',
                style: TextStyle(color: Colors.white, fontSize: 30),
                // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white70),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xff262626),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15),
                  child: Column(
                    children: [
                       Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('환경부/로밍 회원', style: TextStyle(color: Colors.white, fontSize: 25),),
                                Text('324.4원', style: TextStyle(color: Colors.white, fontSize: 25),),
                              ],
                            ),
                          ),
                          Divider(color: CastProColor.dividerColor,height: 5,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('환경부/로밍 회원', style: TextStyle(color: Colors.white, fontSize: 25),),
                                Text('324.4원',style: TextStyle(color: Colors.white, fontSize: 25),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                '고객센터 070-3855-2090',
                style: TextStyle(color: Colors.white30, fontSize: 15),
                // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
