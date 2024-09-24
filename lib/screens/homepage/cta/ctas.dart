import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vcuadmin/screens/attendance/attbatches.dart';
import 'package:vcuadmin/screens/doubts/stdlist.dart';
import 'package:vcuadmin/screens/fees/fees.dart';
import 'package:vcuadmin/screens/marks/markbatches.dart';
import 'package:vcuadmin/screens/myaccount.dart';
import 'package:vcuadmin/screens/reports/viewreport.dart';
import 'package:vcuadmin/screens/timetable/timetablebatch.dart';

import '../../../models/userdata.dart';
import 'cta_card.dart';

class CTAS extends StatelessWidget {
  const CTAS({Key? key, required this.userData}) : super(key: key);

  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xffADA2FF),
                    ctaction: AttendanceBatches(),
                    title: 'Attendance',
                    icon: Icon(
                      FontAwesomeIcons.userClock,
                      size: 50,
                      color: Color(0xffADA2FF),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xffFFAACF),
                    ctaction: MarkBatches(),
                    title: 'Marks',
                    icon: Icon(
                      FontAwesomeIcons.chartColumn,
                      size: 50,
                      color: Color(0xffFFAACF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xff6F69AC),
                    ctaction: TimetableBatch(),
                    title: 'Timetable',
                    icon: Icon(
                      FontAwesomeIcons.calendarCheck,
                      size: 50,
                      color: Color(0xff6F69AC),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0XFF3DB2FF),
                    ctaction: ViewReport(),
                    title: 'Report',
                    icon: Icon(
                      FontAwesomeIcons.book,
                      size: 50,
                      color: Color(0XFF3DB2FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xffFF1700),
                    ctaction: Fees(),
                    title: 'Fees',
                    icon: Icon(
                      FontAwesomeIcons.moneyCheckDollar,
                      size: 50,
                      color: Color(0xffFF1700),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xffFFAACF),
                    ctaction: StdList(),
                    title: 'Doubts',
                    icon: Icon(
                      FontAwesomeIcons.solidCircleQuestion,
                      size: 50,
                      color: Color(0xffFFAACF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: CtaCard(
                    bColor: Color(0xffADA2FF),
                    ctaction: MyAccount(),
                    title: 'My Account',
                    icon: Icon(
                      Icons.account_circle_sharp,
                      size: 50,
                      color: Color(0xffADA2FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // GridView.count(
          //     shrinkWrap: true,
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 8.0,
          //     mainAxisSpacing: 8.0,
          //     children: List.generate(
          //       ctalist.length,
          //       (index) {
          //         return GestureDetector(
          //           onTap: (){},
          //           child: CtaCard(
          //             action: ctalist[index],
          //           ),
          //         );
          //       },
          //     )),
        ],
      ),
    );
  }
}
