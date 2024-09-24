import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/singout_button.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: "Account"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: kHeadingStyle,
            ),
            Text(
              'Admin',
              style: kContentHeadingStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: CustomSignOutButton(),
            )
          ],
        ),
      ),
    );
    ;
  }
}
