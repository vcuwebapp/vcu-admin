import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/reports/showreport.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class ReportStudentsList extends StatelessWidget {
  ReportStudentsList(
      {Key? key, required this.batch, required this.std, required this.date})
      : super(key: key);
  final String date;
  final String std;
  final String batch;
  final reportRef = FirebaseFirestore.instance.collection('report');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(
        screenname: 'View Report',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: StreamBuilder(
                      stream: reportRef
                          .doc(date)
                          .collection('$std$batch')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return Center(
                              child: Text(
                            'No Data Is Available',
                            style: kContentHeadingStyle,
                          ));
                        }

                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((document) {
                            print(document);
                            return SubjectCard(
                                subjectTitle: document['name'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowReport(
                                                date: document['date'],
                                                subj1t: document['hourPhy'],
                                                subj2t: document['hourChe'],
                                                subj3t: document['hourMat'],
                                                subj4t: document['hourBio'],
                                                subj5t: document['hourExt'],
                                                subj1: document['topicPhy'],
                                                subj2: document['topicChe'],
                                                subj3: document['topicMat'],
                                                subj4: document['topicBio'],
                                                subj5: document['topicExt'],
                                              )));
                                });
                          }).toList(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
