import 'package:buy_mate/screens/login/login.dart';
import 'package:buy_mate/screens/login/verify.dart';
import 'package:flutter/material.dart';
// import 'package:buy_mate/screens/authentication_screen.dart';
import 'package:buy_mate/screens/loading_screen.dart';
import 'package:buy_mate/screens/onboarding/first_page.dart';
import 'package:buy_mate/screens/onboarding/second_page.dart';
import 'package:buy_mate/screens/onboarding/third_page.dart';
// import 'package:buy_mates/screens/home_screen.dart';
// import 'package:buy_mate/screens/verify_phone_number_screen.dart';

class RouteGenerator {
  static const _id = 'RouteGenerator';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    // log(_id, msg: "Pushed ${settings.name}(${args ?? ''})");
    switch (settings.name) {
      case LoadingScreen.id:
        return _route(const LoadingScreen());
      case FirstPage.id:
        return _route(const FirstPage());
      case SecondPage.id:
        return _route(const SecondPage());
      case ThirdPage.id:
        return _route(const ThirdPage());
      case Login.id:
        return _route( Login());
      case VerifyScreen.id:
        return _route(VerifyScreen());
      // case HomeScreen.id:
      //   return _route(const HomeScreen());
      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _route(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);

  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('ROUTE \n\n$name\n\nNOT FOUND'),
        ),
      ),
    );
  }
}
