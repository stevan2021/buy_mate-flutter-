import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buy_mate/theme/styles.dart';

class SecondPage extends StatefulWidget {
  static const id = 'SecondPage';

  const SecondPage({Key key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _counter = 0.01;
  Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _counter = _counter + 0.01; //Increment Counter
      });
      if (_counter == 100) {
        timer.cancel();
      }
      // debugPrint(timer.tick.toString());
    });
    loadNextScreen();
  }

  void loadNextScreen() {
    (() async {
      await Future.delayed(const Duration(seconds: 10));

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, 'ThirdPage');
    })();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  _getFunction() {
    Navigator.pushReplacementNamed(context, 'ThirdPage');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _getFunction(),
      child: Scaffold(
        body: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Image.asset(
            'asset/img3.png',
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height / 5,
              child: DefaultTextStyle(
                style: GoogleFonts.openSans(
                    fontSize: 25,
                    color: Styles.blackColor,
                    fontWeight: FontWeight.bold),
                child: Center(
                  child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                            'Boost your purchasing power by connecting friends and family to your account',
                            speed: const Duration(milliseconds: 100),
                            textAlign: TextAlign.center)
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9 - 30,
          ),
          GestureDetector(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, left: 12),
                  child: Image.asset(
                    'asset/arrow-icon.png',
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1),
                    duration: const Duration(milliseconds: 2000),
                    builder: (context, value, _) => CircularProgressIndicator(
                      color: Styles.yellowColor,
                      backgroundColor: const Color.fromARGB(255, 219, 219, 195),
                      value: _counter,
                      // Change this value to update the progress
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              countdownTimer.cancel();
              Navigator.pushReplacementNamed(context, 'ThirdPage');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'Skip',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Styles.greyColor,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () {
              countdownTimer.cancel();
              Navigator.pushReplacementNamed(context, 'Login');
            },
          )
        ]),
        /* add child content here */
      ),
    );
  }
}