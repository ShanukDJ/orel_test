import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_test/screens/business_screen.dart';
import 'package:orel_test/screens/science_screen.dart';
import 'package:orel_test/ui_helpers/colors.dart';
import 'package:flutter/material.dart';

import '../screens/technology_screen.dart';
import 'header_bar.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int? barIndex;

  @override
  void initState() {
    super.initState();
    barIndex = widget.currentIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const ScienceScreen(),
    const BusinessScreen(),
    const TechnologyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: [
          //heading bar with title
          const HeaderBar(),
          //bottom bar screens
          Container(
            child: _widgetOptions.elementAt(barIndex!),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        currentIndex: barIndex!,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: AppColors.colorWhite,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.colorYellow.withOpacity(0.7),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            barIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 25.w,
                  ),
                ],
              ),
              activeIcon: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.colorYellow.withOpacity(0.7),
                    size: 25.w,
                  ),
                ],
              ),
              label: "Science"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 25.w,
              ),
              activeIcon: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: AppColors.colorYellow.withOpacity(0.7),
                    size: 25.w,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
              label: "Business"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.terminal,
                size: 25.w,
              ),
              activeIcon: Column(
                children: [
                  Icon(
                    Icons.terminal,
                    color: AppColors.colorYellow.withOpacity(0.7),
                    size: 25.w,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
              label: "Technology"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    super.dispose();
  }
}
