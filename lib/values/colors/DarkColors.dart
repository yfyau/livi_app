import 'dart:ui';

import 'package:flutter/material.dart';

import 'BasicColors.dart';

class DarkColors implements BasicColors {
  @override
  Color get primary => Color(0xff323232);

  @override
  Color get text => Color(0xffccdb86);

  @override
  Color get background => Color(0xff424242);

  @override
  Color get border => Color(0xffa8a8a8);

  @override
  Color get dropdownBg => Color(0xff4c4c4c);
}
