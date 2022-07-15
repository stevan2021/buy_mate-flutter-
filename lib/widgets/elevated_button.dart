import 'package:flutter/material.dart';

SizedBox elevatedButton(
    {BuildContext context,
    double size,
    String text,
    Function() function,
    double rounded}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * (size ?? 0.85),
    height: 60,
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded ?? 10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.black)),
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ),
  );
}
