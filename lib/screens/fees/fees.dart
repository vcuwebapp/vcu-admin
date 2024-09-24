import 'package:flutter/material.dart';
import 'package:vcuadmin/screens/fees/searchstudents.dart';
import 'package:vcuadmin/screens/fees/updatedeadline.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class Fees extends StatelessWidget {
  const Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Fees'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SubjectCard(
                  subjectTitle: 'Update Fees',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchStudents()));
                  }),
              SubjectCard(
                  subjectTitle: 'Update Deadline',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateDeadline()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
