import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
class CtaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CtaAppbar({Key? key, required this.screenname});

  final String screenname;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:const Padding(
        padding:  EdgeInsets.only(top: 20),
        child:  BackButton(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          screenname,
          style:const TextStyle(
              color: kHeadingColor,
              fontSize: 30,
              fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
