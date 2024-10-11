import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/task_management_screen.dart';
import 'screens/time_tracking_screen.dart';
import 'screens/ai_insights_screen.dart';

void main() {
  runApp(SynapseApp());
}

class SynapseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synapse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SynapseHomePage(),
    );
  }
}

class SynapseHomePage extends StatefulWidget {
  @override
  _SynapseHomePageState createState() => _SynapseHomePageState();
}

class _SynapseHomePageState extends State<SynapseHomePage> {
  int _selectedIndex = 0;
  
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TaskManagementScreen(),
    TimeTrackingScreen(),
    AIInsightsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insights',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}