import 'package:burger_project/UI/screens/homeScreen.dart';
import 'package:burger_project/UI/screens/orderScreen.dart';
import 'package:burger_project/UI/screens/paymentScreen.dart';
import 'package:burger_project/UI/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        Orderscreen.routeName: (_) => Orderscreen(),
        Paymentscreen.routeName: (_) => Paymentscreen(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
