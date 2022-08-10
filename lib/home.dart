import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:project_link1/config.dart';
import 'package:project_link1/page/home_page.dart';
import 'package:project_link1/page/item_details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool logindurum = false;

  List pagekey = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sayfalar = [
      const Home_page(),
      const p_details(),
    ];
    return WillPopScope(
        onWillPop: () async {
          var durum =
              await await pagekey[Config.selectedIndex].currentState.maybePop();
          if (durum) {
            return false;
          } else {
            if (Config.selectedIndex == 0) {
              return true;
            } else {
              setState(() {
                Config.selectedIndex = 0;
              });
              return false;
            }
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: Navigator(
            key: pagekey[Config.selectedIndex],
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) {
                  return sayfalar[Config.selectedIndex];
                },
              );
            },
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              //boxShadow: [boxShadow],
              borderRadius: BorderRadius.only(
                  // topRight: Radius.circular(20),
                  // topLeft: Radius.circular(20),
                  ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.home,
                    size: 20,
                  ),
                  label: "Home Page",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.shopping_bag,
                    size: 20,
                  ),
                  label: "Products",
                ),
              ],
              currentIndex: Config.selectedIndex,
              selectedItemColor: Color.fromARGB(255, 209, 115, 27),
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  Config.selectedIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
