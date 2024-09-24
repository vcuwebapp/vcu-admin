import 'package:flutter/material.dart';
import 'package:vcuadmin/screens/marks/indmarks/marksortlist.dart';
import 'package:vcuadmin/screens/marks/marks.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class MarkBatches extends StatelessWidget {
  const MarkBatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Marks'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SubjectCard(
                  subjectTitle: 'View Marks',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MarksSortList()));
                  },
                ),
                SubjectCard(
                    subjectTitle: 'XI Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MarksScreen(
                                    batchname: 'xiregular',
                                  )));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MarksScreen(batchname: 'xiengineering')));
                    }),
                SubjectCard(
                    subjectTitle: 'XI Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MarksScreen(batchname: 'ximedical')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Regular',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MarksScreen(batchname: 'xiiregular')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Engineering',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MarksScreen(batchname: 'xiiengineering')));
                    }),
                SubjectCard(
                    subjectTitle: 'XII Medical',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MarksScreen(
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
