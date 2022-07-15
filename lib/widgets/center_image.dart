import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {
  final String image;

  const CenterImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        (image),
        fit: BoxFit.fill,
      ),
    );
  }
}
