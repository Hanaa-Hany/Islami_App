import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/Logo.png"),
        Card(
          margin: EdgeInsets.all(20),
          elevation: 3,
          color: AppColors.primaryDark,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("16 july 2024"),
                      Text("16 july 2024"),
                      Text("16 july 2024")
                    ],
                  ),
                ),
                Row(children: [
                  Text("16 july 2024"),
                  Text("16 july 2024"),
                  Text("16 july 2024")
                ]),
                Row(children: [
                  Text("16 july 2024"),
                  Text("16 july 2024"),
                  Text("16 july 2024")
                ])
              ],
            ),
          ),
        )
      ],
    );
  }
}
