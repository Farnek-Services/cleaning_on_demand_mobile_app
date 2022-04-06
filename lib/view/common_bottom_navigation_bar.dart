import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/model/assets.dart';
import 'package:carbon_footprint/view/home_page.dart';
import 'package:carbon_footprint/view/progress_list_page.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CommonBottomNavigationBarState createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          ProgressListPage(
            title: "New Request",
            type: 0,
          ),
          ProgressListPage(title: "Ongoing Request", type: 1),
          ProgressListPage(title: "Completed Request", type: 2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.home_icon,
                width: 30,
                height: 30,
                color: Colors.white54,
              ),
              activeIcon: SvgPicture.asset(
                Assets.home_icon,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.new_request,
                width: 30,
                height: 30,
                color: Colors.white54,
              ),
              activeIcon: SvgPicture.asset(
                Assets.new_request,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'New',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.ongoing_request,
                width: 30,
                height: 30,
                color: Colors.white54,
              ),
              activeIcon: SvgPicture.asset(
                Assets.ongoing_request,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Ongoing',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.completed_request,
                width: 30,
                height: 30,
                color: Colors.white54,
              ),
              activeIcon: SvgPicture.asset(
                Assets.completed_request,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Completed',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: MyColors.appColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          iconSize: 35,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }
}
