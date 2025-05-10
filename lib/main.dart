
import 'package:flutter/material.dart';
  
import 'UI/screens/homeScreen.dart';
import 'UI/screens/orderScreen.dart';
import 'UI/screens/paymentScreen.dart';
import 'UI/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        Orderscreen.routeName: (_) => Orderscreen(),
        Paymentscreen.routeName: (_) => const Paymentscreen(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
