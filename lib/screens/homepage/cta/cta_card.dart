import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class CtaCard extends StatelessWidget {
  const CtaCard(
      {super.key,
      required this.ctaction,
      required this.title,
      required this.icon,
      required this.bColor});

  final Widget ctaction;
  final String title;
  final Icon icon;
  final Color bColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ctaction),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: bColor,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Text(
                title,
                textAlign: TextAlign.center,
                style: kContentHeadingStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
