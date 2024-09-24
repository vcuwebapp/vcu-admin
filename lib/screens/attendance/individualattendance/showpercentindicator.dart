import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vcuadmin/constants.dart';

class CustomPercentCard extends StatelessWidget {
  const CustomPercentCard({Key? key, required this.pres, required this.total})
      : super(key: key);

  final int pres;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kTypicalCardDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularPercentIndicator(
              radius: 50,
              lineWidth: 15,
              percent: pres / total,
              animation: true,
              animationDuration: 30,
              progressColor: kOrangeColor,
              center: Text(
                '${pres}/${total}',
                style: kContentHeadingStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
