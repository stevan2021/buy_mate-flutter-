import 'package:flutter/material.dart';

void nextPage({ BuildContext context,  Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
