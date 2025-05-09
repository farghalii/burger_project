import 'package:burger_project/UI/tabs/favTab.dart';
import 'package:burger_project/UI/tabs/homeTab.dart';
import 'package:burger_project/UI/tabs/profileTab.dart';
import 'package:burger_project/core/utils/appAssets.dart';
import 'package:burger_project/core/utils/appColors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    Hometab(),
    Favtab(),
    Profiletab(),
  ];
  int selected_index = 0;
  bool isTabed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        onTap: (index) {
          selected_index = index;
          setState(() {});
        },
        backgroundColor: Appcolors.redColor,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(selected_index == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(selected_index == 1
                ? Icons.favorite
                : Icons.favorite_border_outlined),
            label: 'fav',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(selected_index == 2 ? Icons.person : Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: tabs.elementAt(selected_index),
    );
  }
}
