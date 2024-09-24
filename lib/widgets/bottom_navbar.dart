import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  final screens=[

  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        selectedItemColor: kOrangeColor,
        unselectedItemColor: kIconColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: 1,
        // onTap: (index)  {
        //   setState(() {
        //     currentIndex = index;
        //   });
        // },

        items: const [
          BottomNavigationBarItem(

            icon: Icon(
              Icons.home,

            ),

            label: 'Home',
          ),
          BottomNavigationBarItem(

              icon: Icon(
                Icons.file_present,

              ),

              label: 'Assignment'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_alarm_rounded,

              ),
              label: 'Attendance'),
          BottomNavigationBarItem(

              icon: Icon(
                Icons.account_circle_sharp,

              ),
              label: 'Account'),
        ]);
  }
}
