import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double bottomNavBarHeight = 60;
  int selectedPos = 0;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        )),
    TabItem(Icons.search, "Search", Colors.orange,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
    TabItem(Icons.layers, "Reports", Colors.red),
    TabItem(Icons.notifications, "Notifications", Colors.cyan)
  ]);

  CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(
    0,
  );
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(
      selectedPos,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomNav(),
          )
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan = "slogan";
    switch (selectedPos) {
      case 0:
        slogan = "Family ,Happiness, Food";
        break;
      case 1:
        slogan = "find,check,use";
        break;
      case 2:
        slogan = "Recive,Rip,Review";
        break;
      case 3:
        slogan = "Noise,Panic,Ignore";
        break;
    }
    return Container(
      color: selectedColor,
      child: Center(
        child: Text(
          slogan,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  //function
  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      animationDuration: const Duration(milliseconds: 300),
      barBackgroundColor: Colors.red,
      selectedCallback: (value) {
        setState(() {
          selectedPos = value!;
        });
      },
    );
  }
}
