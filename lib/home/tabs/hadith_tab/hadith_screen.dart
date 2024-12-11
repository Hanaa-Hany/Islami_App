import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:islami_app/home/tabs/hadith_tab/hadith_details.dart';
import 'package:islami_app/model/hadith_model.dart';

import '../../../app_colors.dart';

class HadithScreen extends StatelessWidget {
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
      Container(
        color: AppColors.primaryDark,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/quran_content_bg.png"),
                  fit: BoxFit.fill)),
          child: FlutterCarousel.builder(
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
                    child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  hadithList[itemIndex].title,
                                  style: textStyle,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                hadithList[itemIndex].content,
                                style: textStyle,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ])),
            options: FlutterCarouselOptions(
                height: 500,
                showIndicator: false,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: .85),

          ),
        ),
      )
    ]);
  }

  loadingHadithFiels() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          (await rootBundle.loadString('assets/files/hadith/h$i.txt'));
      //print(hadithList);
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      print("title$title");
      hadithLines.removeAt(0);
      String content = hadithLines.join('');
      HadithModel hadithModel = HadithModel(title: title, content: content);
      hadithList.add(hadithModel);
    }
  }
}
