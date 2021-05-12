import 'package:flutter/material.dart';
import 'package:livi_app/values/LiviTheme.dart';
import 'package:livi_app/routes.dart';

/// For prevent the initial white screen during Flutter Engine warm up,
/// splash image should also set in both Android and iOS Native

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(PATH_PHONE_VALIDATION),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/splash_screen.png',
        width: 100,
      ),
    );
  }
}
