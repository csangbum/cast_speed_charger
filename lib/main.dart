import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test3/screen/main_screen.dart';
import 'package:test3/utils/reboot_plugin.dart';
import 'package:test3/utils/utils.dart';
import 'package:video_player/video_player.dart';

import 'charger_info.dart';
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
          fontFamily: GuiConstants.fontFamilyNoto, // 기본 폰트 설정
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
  final chargerFeeHeightRatio = 350 / 1920 *100;
  final bottomHeightRatio = 260 / 1920 *100;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // 비디오 파일의 경로를 지정합니다.
    // _controller = VideoPlayerController.asset('assets/shutterstock.mp4')
    //   ..initialize().then((_) {
    //     Utils.logMsg('csangbum done');
    //     _controller.setLooping(true);
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    // 페이지가 dispose될 때 비디오 컨트롤러를 해제합니다.
    // _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double feeHeight = Utils.getVerticalSize(widget.chargerFeeHeightRatio, context);
    double bottomHeight = Utils.getVerticalSize(widget.bottomHeightRatio, context);
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CastProColor.mainBackgroundColor,
      body: InkWell(
        highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트
        splashColor: Colors.transparent, //클릭시 원형 이펙트
        onTap: () async {
          try {
            await RebootPlugin.reboot();
            print('Device rebooting...');
          } catch (e) {
            print('Failed to reboot device: $e');
          }
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const MainScreen();
          }));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StatusBarWidget(screenCallback: (){
                String currentRouteName = ModalRoute.of(context)!.settings.name!;
                print('csangbum Current route: $currentRouteName');
                if (ChargerInfo.getInstance().isDemoMode ) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                }
              },),
              // const Divider(height: 3, color: CastProColor.dividerColor,),
              const SizedBox(height: 80,),
              Text('w : $sizeW and H: $sizeH', style: TextStyle(color: Colors.white),),

              const Image(
                image: AssetImage('assets/castpro_logo.png'),
                width: 300,
                filterQuality: FilterQuality.high,
              ),
              // const Divider(height: 3, color: CastProColor.dividerColor,),
              Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xff010101),
                    ),
                    child: const Image(
                      image: AssetImage('assets/main_image.png'),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
              ),
              // const Divider(height: 3, color: CastProColor.dividerColor,),
              const Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  '화면을 터치해주세요!',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white70),
                ),
              ),
              // const Divider(height: 3, color: CastProColor.dividerColor,),
              Container(
                height: feeHeight,
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
                                Text('환경부/로밍 회원', style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: GuiConstants.fontFamilyNoto),),
                                Text('324.4원', style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: GuiConstants.fontFamilyNoto),),
                              ],
                            ),
                          ),
                          Divider(color: CastProColor.dividerColor,height: 5,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('신용카드', style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: GuiConstants.fontFamilyNoto),),
                                Text('200.0원',style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: GuiConstants.fontFamilyNoto),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // const Divider(height: 3, color: CastProColor.dividerColor,),
              SizedBox(
                height: bottomHeight,
                child: const Center(
                  child: Text(
                    '고객센터 070-3855-2090',
                    style: TextStyle(color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: GuiConstants.fontFamilyNoto),
                    // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
