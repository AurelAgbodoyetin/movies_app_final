import 'package:ep_movie_app/screens/search_screen.dart';
import 'package:ep_movie_app/screens/trending_screen.dart';
import 'package:ep_movie_app/screens/upcoming_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [
    TrendingScreen(),
    SearchScreen(),
    UpcomingScreen(),
  ];
  int _currentTab = 0;

  void _handleTabTap(int tapedIndex) {
    setState(() {
      _currentTab = tapedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _currentTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _handleTabTap,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: "Trending",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Upcoming",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: _children[_currentTab],
      ),
    );
  }
}
