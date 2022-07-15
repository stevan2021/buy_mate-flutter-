import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buy_mate/theme/styles.dart';

class ThirdPage extends StatefulWidget {
  static const id = 'ThirdPage';
  const ThirdPage({Key key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  _getFunction() {
    Navigator.pushReplacementNamed(context, 'Login');
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
            'asset/img2.png',
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Boost your purchasing power by connecting friends and family to your account',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 25,
                  color: Styles.blackColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width - 50,
                height: 60,
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 0, 0, 0))),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'Login');
                  },
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Styles.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ]),
        /* add child content here */
      ),
    );
  }
}