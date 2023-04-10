import 'package:flutter/material.dart';
import 'package:tpm1/help.dart';
import 'package:tpm1/home.dart';
import 'package:tpm1/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _container = const [Home(), Help(), Login()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          }
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.assignment,
            ),
            icon: Icon(
              Icons.assignment,
              color: Colors.grey,
            ),
            label: "Bantuan",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.exit_to_app,
            ),
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            label: "Keluar",
          )
        ],
      ),
    );
  }
}
