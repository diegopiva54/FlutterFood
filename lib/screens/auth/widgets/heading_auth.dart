import 'package:flutter/material.dart';

class HeadingAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/icon.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
