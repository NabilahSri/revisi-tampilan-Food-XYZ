import 'package:coba/home.dart';
import 'package:coba/profil.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigation extends StatefulWidget {
  int id;
  CustomBottomNavigation({super.key, required this.id});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  var index = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      index = widget.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(18),
        items: [
          SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Utama"),
              selectedColor: Color.fromARGB(255, 0, 1, 102)),
          SalomonBottomBarItem(
              icon: Icon(Icons.people),
              title: Text("Profil"),
              selectedColor: Color.fromARGB(255, 0, 1, 102))
        ],
        currentIndex: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: Container(
          color: Colors.white, child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const Profil();
        break;
      default:
        widget = const Home();
    }
    return widget;
  }
}
