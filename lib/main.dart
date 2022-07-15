import 'package:buy_mate/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/providers/mate_provider.dart';
import 'package:buy_mate/screens/loading_screen.dart';
import 'package:provider/provider.dart';
// import 'package:buy_mate/utils/app_theme.dart';
import 'package:buy_mate/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buy Mates',
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: LoadingScreen.id,
        home: const LoadingScreen(),
      ),
    );
  }
}
