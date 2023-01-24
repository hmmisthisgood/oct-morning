import 'package:flutter/material.dart';
import 'package:start_app/screen/ig_post_screen.dart';
import 'package:start_app/screen/tab_screen.dart';
import 'package:start_app/screen/tiktok_skeleton.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _activeIndex = 0;

  final pageController = PageController();

  List<Widget> bodyWidgets = [
    IgHomeScreen(),
    TabScreen(),
    TikTokSkeleton(),
  ];

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        _activeIndex = index;
        setState(() {});
        pageController.jumpToPage(index);

        print("active index is: $_activeIndex");
      },
      currentIndex: _activeIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
      ],
    );
  }

  buildBodyPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        _activeIndex = index;
        // setState(() {});
      },
      controller: pageController,
      children: bodyWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Main screen build");
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(pageController: pageController),
        body: buildBodyPageView()
        //  bodyWidgets[_activeIndex],
        );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({required this.pageController});

  final PageController pageController;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("bottom nav bar build");
    return BottomNavigationBar(
      onTap: (index) {
        _activeIndex = index;
        setState(() {});
        widget.pageController.jumpToPage(index);

        print("active index is: $_activeIndex");
      },
      currentIndex: _activeIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
      ],
    );
  }
}
