import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:buy_mate/theme/styles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FirstPage extends StatefulWidget {
  static const id = 'FirstPage';
  const FirstPage({Key key}) : super(key: key);
  
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double _counter = 0.01;
  Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return;
      setState(() {
        _counter = _counter + 0.01; //Increment Counter
      });
      if (_counter == 99) {
        timer.cancel();

      }
      // debugPrint(timer.tick.toString());
    });
    loadNextScreen();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void loadNextScreen() {
    (() async {
      await Future.delayed(const Duration(seconds: 10));

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, 'SecondPage');
    })();
  }

  _getFunction() {
    Navigator.pushReplacementNamed(context, 'SecondPage');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _getFunction(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Image.asset(
              'asset/home.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height / 10,
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
                              'Get your property that you want with mates',
                              speed: const Duration(milliseconds: 100),
                              textAlign: TextAlign.center)
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
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
                      duration: const Duration(milliseconds: 2200),
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
                Navigator.pushReplacementNamed(context, 'SecondPage');
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
          ],
        ),
        /* add child content here */
      ),
    );
  }
}
