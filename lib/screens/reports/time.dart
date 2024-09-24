import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class Time extends StatelessWidget {
  const Time({Key? key, required this.text, required this.isTime})
      : super(key: key);

  final String text;
  final bool isTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 30,
        width: isTime ? 70 : MediaQuery.of(context).size.width / 1.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Center(
            child: Text(
          text,
          style: kTileHeadingStyle,
        )),
      ),
    );
  }
}
