//flutter
import 'package:flutter/material.dart';
//widgets
import 'package:up_todo/widgets/home_appbar.dart';
import 'package:up_todo/widgets/home_content.dart';
import 'package:up_todo/widgets/navigation_home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int _currentIndex = 0;
  final List<Widget> _screens = [HomeContent(), HomeContent(), HomeContent()];
  final List<PreferredSizeWidget> _appbar = [
    HomeAppbar(),
    HomeAppbar(),
    HomeAppbar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: _appbar[_currentIndex],
      body: _screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8685E7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: NavigationHome(currentIndex: _currentIndex),
      ),
    );
  }
}
