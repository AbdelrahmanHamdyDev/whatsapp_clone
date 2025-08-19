import 'package:flutter/material.dart';
import 'package:whatsapp_clone/View/homeScreen/homeScreen.dart';
import 'package:whatsapp_clone/View/statusScreen/statusScreen.dart';

class BottomNavWithPageView extends StatefulWidget {
  const BottomNavWithPageView({super.key});

  @override
  State<BottomNavWithPageView> createState() => _BottomNavWithPageViewState();
}

class _BottomNavWithPageViewState extends State<BottomNavWithPageView> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomeScreen(),
          statusScreen(),
          Center(child: Text("Communities")),
          Center(child: Text("Calls")),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onNavTapped,
        indicatorColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: "Chats",
          ),
          NavigationDestination(
            icon: Icon(Icons.update),
            selectedIcon: Icon(Icons.update),
            label: "Updates",
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: "Communities",
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            selectedIcon: Icon(Icons.call),
            label: "Calls",
          ),
        ],
      ),
    );
  }
}
