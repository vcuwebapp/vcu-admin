import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/attendance/individualattendance/days_absentcard.dart';
import 'package:vcuadmin/screens/attendance/individualattendance/showpercentindicator.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

class IndividualAttendance extends StatefulWidget {
  const IndividualAttendance(
      {Key? key, required this.std, required this.batch, required this.name})
      : super(key: key);

  final String std;
  final String batch;
  final String name;

  @override
  State<IndividualAttendance> createState() => _IndividualAttendanceState();
}

class _IndividualAttendanceState extends State<IndividualAttendance> {
  int? totalatt;
  int? totalpres;
  double? percent;
  late final attendanceRef = FirebaseFirestore.instance
      .collection("attendance")
      .doc(widget.std.toLowerCase())
      .collection(widget.batch.toLowerCase());

  Future getTotal() async {
    // Get docs from collection reference
    final QuerySnapshot qSnap = await attendanceRef.get();
    final QuerySnapshot querySnapshot =
        await attendanceRef.where(widget.name, isEqualTo: true).get();
    totalatt = qSnap.docs.length;
    totalpres = querySnapshot.docs.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Attendance'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: getTotal(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CustomPercentCard(
                          total: totalatt!,
                          pres: totalpres!,
                        );
                      } else {
                        return Center(child: const CircularProgressIndicator());
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    ' Days Absent',
                    style: kContentHeadingStyle,
                  ),
                ),
                // AbsentCard(absentDate: '31 March 2022')
                StreamBuilder(
                    stream: attendanceRef
                        .where(widget.name, isEqualTo: false)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((document) {
                          print(document);
                          return AbsentCard(
                            absentDate: document['date'],
                          );
                        }).toList(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
