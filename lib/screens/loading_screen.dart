import 'package:flutter/material.dart';
import 'package:buy_mate/theme/styles.dart';
import 'package:buy_mate/screens/onboarding/first_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buy_mate/screens/home/activity.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);
  static const id = 'LoadingScreen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future getFuture;

  Future<void> initial() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    getFuture = initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Image.asset('asset/logo-wh.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Property Sharing Solutions',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: Styles.whiteColor,
                            fontWeight: FontWeight.bold),
                      )
                  ],
                ),
              ) /* add child content here */,
            ),
            // backgroundColor: Colors.black,
            // body: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           SizedBox(
            //             height: 30,
            //           ),
            //           Flexible(
            //             child: SizedBox(
            //               height: MediaQuery.of(context).size.height * 0.35,
            //               width: MediaQuery.of(context).size.width * 0.8,
            //               child: CenterImage(image: 'asset/logo.png'),
            //             ),
            //           ),
            //           BoldText(
            //             text: 'Property Sharing solutions',
            //             color: Colors.white,
            //           ),
            //         ],
            //       ),
            //     ),
            //     const Align(
            //       alignment: Alignment.bottomCenter,
            //       child: CenterImage(image: 'asset/background.png'),
            //     ),
            //   ],
            // ),
          );
        }
        return const FirstPage();
      },
    );
  }
}