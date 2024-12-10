import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/hadith_tab/hadith_screen.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_screen.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_screen.dart';
import 'package:islami_app/home/tabs/sebha_tab/sebha_screen.dart';
import 'package:islami_app/home/tabs/time_tab/time_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> listOfBcImages = [
    "assets/images/quran_bg.png",
    "assets/images/hadith_bg.png",
    "assets/images/sebha_bg.png",
    "assets/images/radio_bg.png",
    "assets/images/time_bg.png"
  ];
  List<Widget> listOfTabs = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen()
  ];

  Widget selectedItem() {
    switch (selectedIndex) {
      case 0:
        return listOfTabs[0];
      case 1:
        return listOfTabs[1];
      case 2:
        return listOfTabs[2];
      case 3:
        return listOfTabs[3];
      case 4:
        return listOfTabs[4];
      default:
        return Scaffold();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(listOfBcImages[selectedIndex],
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,),
      Scaffold(
          bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon:builtItemInBottomNavBar(index: 0, image: "quran_ic"),
              label: "Quran",
            ),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavBar(index: 1, image: "hadith_ic"),
                label: "Hadith"),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavBar(index: 2, image: "sebha_ic"),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavBar(index: 3, image: "radio_ic"),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavBar(index: 4, image: "time_ic"),
                label: "Time"),
          ],
        ),

      ),
      body: selectedItem(),)
    ]);

  }
  Widget builtItemInBottomNavBar({required index, required String image}){
    return  selectedIndex == index
        ? Container(
        padding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
            color: Color(0x99202020),
            borderRadius: BorderRadius.circular(66)),
        child:
        ImageIcon(AssetImage("assets/images/$image.png")))
        : ImageIcon(AssetImage("assets/images/$image.png"));
  }
}
