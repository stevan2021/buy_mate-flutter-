import 'package:flutter/material.dart';
import 'package:buy_mate/widgets/text_styles.dart';

class Activity extends StatefulWidget {
  const Activity({Key key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 17,
                        ),
                        const Text(
                          'Properties that you liked',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        extraBoldText(
                            text: '9 miller st, Bondi beach',
                            color: Colors.black,
                            size: 15),
                        extraBoldText(
                            text: '2 kurrawa av, Cogge',
                            color: Colors.black,
                            size: 15),
                        extraBoldText(
                            text: '41 bay st, Double Bay',
                            color: Colors.black,
                            size: 15),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        const Text(
                          'Purchase power verified process',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        extraBoldText(
                            text: 'Documentations Requested',
                            color: Colors.black,
                            size: 15),
                        extraBoldText(
                            text: 'Documentations recived',
                            color: Colors.black,
                            size: 15),
                        extraBoldText(
                            text: 'Verified purchasing power',
                            color: Colors.black,
                            size: 15),
                        extraBoldText(
                            text: 'Mortgage aproved',
                            color: Colors.black,
                            size: 15),
                      ]
                )
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

