import 'package:flutter/material.dart';
import 'package:vcuadmin/screens/timetable/timetable.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

import '../../widgets/subject_card.dart';

class TimetableBatch extends StatelessWidget {
  const TimetableBatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Timetable'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SubjectCard(
                    subjectTitle: 'XI Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'xiregular',
                                    std: 'xi',
                                    batch: 'regular',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'xiengineering',
                                    std: 'xi',
                                    batch: 'engineering',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'ximedical',
                                    std: 'xi',
                                    batch: 'medical',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'xiiregular',
                                    std: 'xii',
                                    batch: 'regular',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'xiiengineering',
                                    std: 'xii',
                                    batch: 'engineering',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeTableScreen(
                                    batchname: 'xiimedical',
                                    std: 'xii',
                                    batch: 'medical',
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
