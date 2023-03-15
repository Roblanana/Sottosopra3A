import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'assets/account_page.dart';
import 'assets/home_page.dart';
import 'assets/setting_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIdex=0;
List<Widget>  screens=[
  HomePage(),
  SettingPage(),
  HomePage(),
  AccountPage(),
];
  void changeIndex(int index){
    setState(() {
     selectedIdex=index; 
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title:Center(child:  Image.asset("lib/assets/logo.png",width: 200,)),
        actions: [SizedBox(width: 50,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: selectedIdex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:"setting"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label:"nana")
        ]
      ),
      body: screens.elementAt(selectedIdex),
    );
  }
}