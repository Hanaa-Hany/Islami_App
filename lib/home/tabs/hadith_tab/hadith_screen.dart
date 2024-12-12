import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/hadith_tab/hadith_details.dart';
import 'package:islami_app/model/hadith_model.dart';

import '../../../app_colors.dart';

class HadithScreen extends StatefulWidget {
  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithModel> hadithList = [];

  var textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.blackColor,
  );

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadingHadithFiels();
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset("assets/images/Logo.png"),
      hadithList.isEmpty
          ? CircularProgressIndicator()
          : carousel_slider.CarouselSlider.builder(
              itemCount: hadithList.length,
              itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(HadithDetails.routeName,
                            arguments: HadithModel(
                                title: hadithList[itemIndex].title,
                                content: hadithList[itemIndex].content));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/hadith_content_bg.png"),
                                fit: BoxFit.fill,),

                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          
                          children: [
                            Text(
                              hadithList[itemIndex].title,
                              style: textStyle,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 20,),
                            Expanded(
                              child: Text(
                                hadithList[itemIndex].content,
                                style: textStyle,
                                textDirection: TextDirection.rtl,
                              ),
                            )
                          ],
                        ),
                      )),
              options: carousel_slider.CarouselOptions(
                  height: 500, viewportFraction: .8, enlargeCenterPage: true,
              autoPlay: true),
            )
    ]);
  }

  loadingHadithFiels() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          (await rootBundle.loadString('assets/files/hadith/h$i.txt'));

      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      print("title$title");
      hadithLines.removeAt(0);
      String content = hadithLines.join('');
      HadithModel hadithModel = HadithModel(title: title, content: content);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
