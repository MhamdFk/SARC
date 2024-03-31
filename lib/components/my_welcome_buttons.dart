import 'package:flutter/material.dart';

class Welcomebutton extends StatelessWidget {
  const Welcomebutton({super.key, this.buttontext, this.onTap, this.color, this.textcolor});
  final String? buttontext;
  final Widget? onTap;
  final Color? color;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (e) => onTap!));
      },
      child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              color: color!,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
              )),
          child: Text(
            buttontext!,
            textAlign: TextAlign.center,
            style:  TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold, color: textcolor!),
          )),
    );
  }
}
