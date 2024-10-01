import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import '../onboarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 10));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff32B768),
      body: Center(
        child: Text(
          'CraveFinder',
          style:TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
            fontSize: 54,
          ),
        ),
      ),
    );
  }
}