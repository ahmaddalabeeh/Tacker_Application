import 'package:api/screen/home_screen/first_screen.dart';
import 'package:api/screen/salary_screen/salary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Color _iconColor = Colors.black;
  Color _iconColor2 = Colors.black;

  static const List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    SalaryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _iconColor = const Color.fromARGB(255, 131, 45, 45);
        _iconColor2 = const Color.fromARGB(255, 103, 110, 106);
      } else {
        _iconColor = const Color.fromARGB(255, 103, 110, 106);
        _iconColor2 = const Color.fromARGB(255, 131, 45, 45);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 131, 45, 45).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey[150],
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/vectors/transactions.svg",
                        height: size.height * 0.04,
                        color: _iconColor,
                      ),
                      label: "T r a n s a c t i o n s"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/vectors/wallet.svg",
                        height: size.height * 0.03,
                        color: _iconColor2,
                      ),
                      label: "S a l a r y")
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: const Color.fromARGB(255, 131, 45, 45),
                onTap: _onItemTapped,
              ),
            )),
        backgroundColor: const Color.fromARGB(255, 226, 221, 221),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
