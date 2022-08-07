import 'package:flutter/material.dart';
//import 'constants.dart';

class RoundButtonIcon extends StatelessWidget {

  RoundButtonIcon({@ required this.icon,@ required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}