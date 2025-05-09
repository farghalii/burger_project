import 'dart:async';

import 'package:burger_project/UI/screens/homeScreen.dart';
import 'package:burger_project/core/utils/appAssets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/Splash screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xffFF939B),
                Color(0xffEF2A39),
              ],
              stops: [0, 1],
              begin: Alignment.topLeft,
            )),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .35,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Foodgo',
                  style: TextStyle(
                    fontFamily: "Lobster",
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .29,
              ),
              Image(
                image: AssetImage(Appassets.burgerSplash2),
                height: size.height * .17,
              ),
            ],
          ),
          Image(
            image: AssetImage(Appassets.burgerSplash1),
            height: size.height * .25,
          ),
        ],
      ),
    );
  }
}
