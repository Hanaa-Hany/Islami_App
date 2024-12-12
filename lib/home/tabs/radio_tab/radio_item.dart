import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class RadioItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool pause=true;
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.primaryDark,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  pause?
                  "assets/images/radio_pause_bg.png"
                  :
                  "assets/images/radio_play_bg.png"
                ),
                fit: BoxFit.fill)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Text("Radio Elmenshawy"),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage("assets/images/fav_ic.png")),
                SizedBox(
                  width: 20,
                ),
                ImageIcon(AssetImage("assets/images/play_ic.png")),
                SizedBox(
                  width: 20,
                ),
                ImageIcon(AssetImage("assets/images/sound_ic.png")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
