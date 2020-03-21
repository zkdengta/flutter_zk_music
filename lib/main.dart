import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterzkmusic/application.dart';
import 'package:provider/provider.dart';
import 'package:flutterzkmusic/pages/splash_page.dart';
import 'package:flutterzkmusic/utils/log_util.dart';
import 'package:flutterzkmusic/route/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
  LogUtil.init(tag: 'NETEASE_MUSIC');
//  runApp(MultiProvider(
////    providers: [
////      ChangeNotifierProvider<UserModel>(
////        builder: (_) => UserModel(),
////      ),
////    ],
////    child: MyApp(),
////  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
        tooltipTheme: TooltipThemeData(verticalOffset: -100000),
      ),
      home: SplashPage(),
//      onGenerateRoute: Application.router.generator,
    );
  }
}
