import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class AbsentCard extends StatelessWidget {
  const AbsentCard({Key? key, required this.absentDate}) : super(key: key);

  final String absentDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: kTypicalCardDecor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Color(0xffc4c4c4),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: kIconColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  absentDate,
                  style: kContentHeadingStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
