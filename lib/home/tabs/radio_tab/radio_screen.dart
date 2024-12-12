import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_item.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabStyle = const TextStyle(
      color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(190.0),
            child: AppBar(
                flexibleSpace: Column(children: [
              Container(
                  child: Image.asset(
                "assets/images/Logo.png",
                fit: BoxFit.contain,
              )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blackOpacityColor,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryDark),
                  tabs: [
                    Tab(
                        child: Text(
                      "Radio",
                      style: tabStyle,
                    )),
                    Tab(
                      child: Text(
                        "Reciters",
                        style: tabStyle,
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
              )
            ]))),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return RadioItemWidget();
              },
              itemCount: 20,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return RadioItemWidget();
              },
              itemCount: 20,
            ),
          ],
        ));
  }
}
