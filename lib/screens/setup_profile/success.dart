import 'package:buy_mate/providers/bottom_navigation_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:buy_mate/constants/color.dart';
import 'package:buy_mate/screens/home/home_screen.dart';
import 'package:buy_mate/widgets/card_widget.dart';
import 'package:buy_mate/widgets/elevated_button.dart';
import 'package:buy_mate/widgets/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fact_check_outlined,
                  color: kBlackColor,
                  size: 150,
                ),
                Center(
                    child:
                        boldText(size: 20, text: 'Well done!', color: kBlackColor)),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: boldText(
                        text: 'Your approximate purchasing power is',
                        textAlign: TextAlign.center,
                        color: kBlackColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kBlackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Bounce(
                        duration: Duration(milliseconds: 110),
                        child: Center(child: boldText(text: '\$250,000', size: 40)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                elevatedButton(
                    context: context,
                    text: 'Find a property',
                    function: () {
                      Provider.of<BottomNavigationProvider>(context, listen: false)
                          .changeIndex(index: 1);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }),
                const SizedBox(
                  height: 20,
                ),
                elevatedButton(
                    context: context,
                    text: 'Go to Home',
                    function: () {
                      Provider.of<BottomNavigationProvider>(context, listen: false)
                          .changeIndex(index: 3);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    const Divider(
                      indent: 5,
                      endIndent: 5,
                      thickness: 2,
                    ),
                    Center(
                      child: Container(
                        width: 50,
                        color: kWhiteColor,
                        child: Center(
                            child: regularText(text: 'Share', color: kBlackColor)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedShareIcons(
                      icon: Icons.facebook_rounded,
                      function: () {},
                    ),
                    RoundedShareIcons(
                      icon: Icons.whatsapp_rounded,
                      function: () {},
                    ),
                    RoundedShareIcons(
                      icon: EvaIcons.emailOutline,
                      function: () {},
                    ),
                    RoundedShareIcons(
                      icon: EvaIcons.twitter,
                      function: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedShareIcons extends StatelessWidget {
  final Function() function;
  final IconData icon;

  const RoundedShareIcons({
     this.function,
     this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CardWidget(
        elevation: 2,
        radius: 5,
        color: kBlackColor,
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
