import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';

class QuranItem extends StatelessWidget {
  int index;
  // String nameOfSuraEnglish;
  // String numOfVerses;
  // String nameOfSuraArabic;
  SuraModel suraModel;
  var textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  var textStyleSmall = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,
  );

  QuranItem(this.index, this.suraModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/sura_num_ic.png"),
            Text(
              "$index",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.englishQuranSura,
                  style: textStyle,
                ),
                Text(
                  "${suraModel.versesList} verses",
                  style: textStyleSmall,
                )
              ],
            ),
            Text(
              suraModel.arabicQuranSura,
              style: textStyle,

            )
          ]),
        )
      ],
    );
  }
}
