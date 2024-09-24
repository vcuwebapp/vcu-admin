import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

import 'time.dart';

class ShowReport extends StatelessWidget {
  const ShowReport({
    super.key,
    required this.date,
    required this.subj1t,
    required this.subj2t,
    required this.subj3t,
    required this.subj4t,
    required this.subj5t,
    required this.subj1,
    required this.subj2,
    required this.subj3,
    required this.subj4,
    required this.subj5,
  });

  final String date;
  final String subj1t;
  final String subj2t;
  final String subj3t;
  final String subj4t;
  final String subj5t;
  final String subj1;
  final String subj2;
  final String subj3;
  final String subj4;
  final String subj5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(
        screenname: 'View Report',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                          date,
                          style: kContentHeadingStyle,
                        )),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Time',
                              style: kContentHeadingStyle,
                            ),
                            Time(text: subj1t, isTime: true),
                            Time(text: subj2t, isTime: true),
                            Time(text: subj3t, isTime: true),
                            Time(text: subj4t, isTime: true),
                            Time(text: subj5t, isTime: true),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Subject',
                                style: kContentHeadingStyle,
                              ),
                              Time(text: subj1, isTime: false),
                              Time(text: subj2, isTime: false),
                              Time(text: subj3, isTime: false),
                              Time(text: subj4, isTime: false),
                              Time(text: subj5, isTime: false),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
