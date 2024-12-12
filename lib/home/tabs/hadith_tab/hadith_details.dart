import 'package:flutter/material.dart';
import 'package:islami_app/model/hadith_model.dart';

import '../../../app_colors.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";
  var textStyle=TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColors.primaryDark
  );
  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
    print("title : ${hadithModel.title}");
    print("content : ${hadithModel.content}");


    return Scaffold(
      appBar: AppBar(
        title: Text(hadithModel.title),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/quran_content_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          ListView(children: [
                      Padding(
          padding: EdgeInsets.symmetric(horizontal: 26,vertical: 80),
          child: Text(
            hadithModel.content,
            style: textStyle,
            textDirection: TextDirection.rtl
          ),
                      )
                    ])
        ],
      ),
    );
  }
}
