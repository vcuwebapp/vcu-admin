import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({Key? key, required this.subjectTitle, required this.onTap}) : super(key: key);

  final String subjectTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: kTypicalCardDecor,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,

                  decoration: BoxDecoration(
                      color: Color(0xffc4c4c4),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.file_present_sharp,
                      color: kIconColor,
                    ),
                  ),
                ),
                Text(subjectTitle, style: kContentHeadingStyle,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.arrow_forward_ios_outlined, color: kIconColor,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
