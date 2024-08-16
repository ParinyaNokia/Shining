import 'package:flutter/material.dart';
import 'package:testgrandle/screens/firstpage.dart';
import 'package:testgrandle/screens/fouthpage.dart';
import 'package:testgrandle/screens/secondpage.dart';
import 'package:testgrandle/screens/thirdpage.dart';

class Bottomtabb extends StatefulWidget {
  const Bottomtabb({super.key});

  @override
  State<Bottomtabb> createState() => _BottomtabbState();
}

class _BottomtabbState extends State<Bottomtabb> {
  int currentindex = 0;

  final activepage = [
    const Firstpage(),
    const Secondpage(),
    const Thirdpage(),
    const Fouthpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: activepage.elementAt(currentindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined), label: "First"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shape_line), label: "Second"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "First"),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: "First"),
        ],
      ),
    );
  }
}
