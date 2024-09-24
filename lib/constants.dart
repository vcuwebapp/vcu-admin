import 'package:flutter/material.dart';

const kOrangeColor = Color(0xffFE8A01);
const kLightGreyColor =  Color(0xffd9d9d9);
const kHeadingColor =  Color(0xff404040);
const kSubheadingColor =  Color(0xff9c9c9c);
const kIconColor = Color(0xff686B6F);

const kContentHeadingStyle = TextStyle(fontSize: 20 , fontWeight: FontWeight.bold, color: kHeadingColor);
const kHeadingStyle = TextStyle(fontSize: 17 , fontWeight: FontWeight.bold, color: kIconColor);
const kTileHeadingStyle = TextStyle(fontSize: 15 , fontWeight: FontWeight.bold, color: kHeadingColor);
const kContentSubHeadingStyle = TextStyle(fontSize: 15 , fontWeight: FontWeight.bold, color: kIconColor);
const kSuperBoldHeadingStyle = TextStyle(

    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: Color(0xffFE8A01));

BoxDecoration kTypicalCardDecor = BoxDecoration(
  color: Colors.white,
  borderRadius:  BorderRadius.circular(6),
  boxShadow: [
    BoxShadow(
        blurRadius: 2,
        offset: Offset(5, 5),
        color: kLightGreyColor),
  ],
);