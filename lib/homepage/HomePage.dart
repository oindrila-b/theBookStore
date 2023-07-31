import 'package:flutter/material.dart';
import 'package:thebookstore/screens/AllBooks.dart';
import 'package:thebookstore/screens/HomeCarousel.dart';
import 'package:thebookstore/screens/UserInfo.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screens/AppInfo.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;


  final pages = [
    const HomeCarousel(),
    const AllBooks(),
    const UserInfo(),
    const AppInfo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
             borderRadius: BorderRadius.vertical(
             top:  Radius.circular(40),
               bottom:  Radius.circular(40),
        ),
          color: Color(0xFF322653),
        ),
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            backgroundColor: Color(0xFF322653),
            color: Colors.white,
            activeColor: Color(0xFF8062D6) ,
            tabBackgroundColor:Color(0xFFB1AFFF)   ,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(icon: Icons.home,
              text: "Home",
                onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
                },
              ),
              GButton(icon: Icons.book,
              text: "All Books",
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
              GButton(icon: Icons.person,
              text: "Profile",
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
              ),
              GButton(icon: Icons.info,
                text: "App",
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
