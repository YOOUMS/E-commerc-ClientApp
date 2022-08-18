import 'package:e_commerce_app/Screens/BasketScreen.dart';

import 'package:e_commerce_app/Screens/DrawerScreen.dart';
import 'package:e_commerce_app/Screens/FavoritesScreen.dart';
import 'package:e_commerce_app/Screens/HomePageScreen.dart';
import 'package:e_commerce_app/Screens/ProfileScreen.dart';
import 'package:e_commerce_app/Widgets/ProductWidget.dart';
import 'package:e_commerce_app/data/dummyData.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;
  Widget currentWidget = HomePageScreen();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromARGB(255, 89, 86, 233),
            onTap: (value) {
              currentIndex = value;
              if (value == 0)
                currentWidget = HomePageScreen();
              else if (value == 1)
                currentWidget = FavoritesScreen();
              else if (value == 2)
                currentWidget = ProfileScreen();
              else if (value == 3) currentWidget = BasketScreen();
              setState(() {});
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 229, 229, 229),
                  icon: Icon(Icons.home_outlined),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 229, 229, 229),
                  icon: Icon(Icons.favorite_border_outlined),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 229, 229, 229),
                  icon: Icon(Icons.perm_identity_rounded),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 229, 229, 229),
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: '')
            ]),
        body: currentWidget);
  }
}
