

import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';
import 'package:study_flutter/navigator/bottom_navigator.dart';
import 'package:study_flutter/page/home_page.dart';
import 'package:study_flutter/page/login_page.dart';
import 'package:study_flutter/page/registration_page.dart';
import 'package:study_flutter/page/vide_detail_page.dart';
import 'package:study_flutter/util/color.dart';

void main() {
  // runApp(const BottomNavigator());
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigator(),
    )
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: white,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:   RegistrationPage(onJumpToLogin: () { print("跳转到登录页面"); },),
//       // home:   const LoginPage(),
//     );
//   }
// }

class BiliApp extends StatefulWidget {
  const BiliApp({super.key});

  @override
  State<BiliApp> createState() => _BiliAppState();
}

class _BiliAppState extends State<BiliApp> {
  BiliRouterDelegate _routerDelegate = BiliRouterDelegate();
  BiliRouterInformationParser _routerInformationParser = BiliRouterInformationParser();

  @override
  Widget build(BuildContext context) {
    //定义route
    var widget = Router(
      routerDelegate: _routerDelegate,
      routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: const RouteInformation(
            location: "/",
          )
      ),
      routeInformationParser: _routerInformationParser,
    );
    return MaterialApp(
      home:widget
    );
  }
}


class BiliRouterDelegate extends RouterDelegate<BiliRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BiliRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey ;
  BiliRouterDelegate():navigatorKey = GlobalKey<NavigatorState>();
  List<MaterialPage> pages = [];
  VideoModel  videoModel = VideoModel(1);
  BiliRoutePath? path;


  @override
  Widget build(BuildContext context) {
    //构建路由栈
    pages = [
      pageWrap(HomePage(
        onJumpToDetail: (VideoModel value) {
        this.videoModel = value;
        notifyListeners();
      },)),
      if(videoModel != null) pageWrap(VideoDetailPage(videoModel: videoModel))
    ];

     return Navigator(
       key: navigatorKey,
       pages: pages,
       onPopPage: (route, result) {
         //这里可以控制是否可以返回
         if(!route.didPop(result)){
            return false;
         }
         return true;
       },
     );


  }


  @override
  Future<void> setNewRoutePath(BiliRoutePath path) async {
    this.path =path;
  }

  }

class BiliRouterInformationParser extends RouteInformationParser<BiliRoutePath> {
  @override
  Future<BiliRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if(uri.pathSegments.isEmpty) {
      return BiliRoutePath.home();
    }
    return BiliRoutePath.detail();
  }
}

//定义路由数据
class BiliRoutePath {
  final String location;
  BiliRoutePath.home() : location = '/';
  BiliRoutePath.detail() : location = '/detail';
}

//创建页面
pageWrap(Widget child) {
  return MaterialPage(
    key: ValueKey(child.hashCode),
    child: child,
  );
}

