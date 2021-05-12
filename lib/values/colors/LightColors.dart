import 'dart:ui';

import 'package:flutter/material.dart';

import 'BasicColors.dart';

class LightColors implements BasicColors {
  @override
  Color get primary => Color(0xffffffff);

  @override
  Color get text => Color(0xff67a030);

  @override
  Color get background => Colors.white;

  @override
  Color get border => Color(0xff000000);

  @override
  Color get dropdownBg => Color(0xffe5e5e5);
}
