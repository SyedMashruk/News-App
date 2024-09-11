import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news/widgets/screens/all_news.dart';
import 'package:news/widgets/custom/custom_app_bar.dart';
import 'package:news/widgets/screens/category_screen.dart';
import 'package:news/widgets/screens/top_news.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.selectedColor,
  });
  final List<Color> selectedColor;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 1;
  List<dynamic> pageList = [
    TopNews(),
    AllNews(),
    const CategoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 238, 205),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 2,
            ),
          ],
        ),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: const Color.fromARGB(255, 255, 238, 205),
          color: const Color(0xffa18249),
          activeColor: Colors.white,
          tabBackgroundGradient: LinearGradient(
            colors: widget.selectedColor,
          ),
          padding: const EdgeInsets.all(14),
          gap: 5,
          iconSize: 28,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.newspaper_sharp,
              text: 'Top News',
              textStyle: GoogleFonts.josefinSans(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            GButton(
              icon: Icons.home,
              text: 'All News',
              textStyle: GoogleFonts.josefinSans(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            GButton(
              icon: Icons.category_outlined,
              text: 'Category',
              textStyle: GoogleFonts.josefinSans(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 238, 205),
        shadowColor: Colors.black,
        elevation: 2,
        title: CustomAppBar(
          title: _selectedIndex == 1
              ? 'All News'
              : _selectedIndex == 0
                  ? 'Top News'
                  : 'Category',
        ),
      ),
      body: pageList.elementAt(_selectedIndex),
    );
  }
}
