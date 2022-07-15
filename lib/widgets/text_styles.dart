import 'package:flutter/material.dart';

Text extraBoldText({String text, Color color, double size}) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 30,
        fontWeight: FontWeight.w800),
  );
}

Text boldText(
    {String text, Color color, double size, TextAlign textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.left,
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 30,
        fontWeight: FontWeight.bold),
  );
}

Text regularText(
    {String text, Color color, double size, TextAlign textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.left,
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 14,
        fontWeight: FontWeight.normal),
  );
}

Text mediumText({String text, Color color, double size}) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 15,
        fontWeight: FontWeight.w500),
  );
}
