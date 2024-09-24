import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class IndMarksCard extends StatelessWidget {
  IndMarksCard(
      {Key? key,
      required this.subject,
      required this.date,
      required this.marksobt,
      required this.outof});

  final String subject;
  final String date;
  final String outof;
  final String marksobt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kLightGreyColor, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subject,
                    style: kContentHeadingStyle,
                  ),
                  Text(
                    date,
                    style: kContentSubHeadingStyle,
                  ),
                  Text(
                    'Out of $outof',
                    style: kContentSubHeadingStyle,
                  )
                ],
              ),
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    marksobt,
                    style: kContentHeadingStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
