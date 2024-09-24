import 'package:flutter/material.dart';
import 'package:vcuadmin/screens/attendance/attendance.dart';
import 'package:vcuadmin/screens/attendance/individualattendance/searchstdatt.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class AttendanceBatches extends StatelessWidget {
  const AttendanceBatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Attendance'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SubjectCard(
                    subjectTitle: "View Attendance",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchStdAtt()));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen(
                                    batchname: 'xiregular',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen(
                                  batchname: 'xiengineering')));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceScreen(batchname: 'ximedical')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceScreen(batchname: 'xiiregular')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen(
                                  batchname: 'xiiengineering')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen(
                                    batchname: 'xiimedical',
                                  )));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
