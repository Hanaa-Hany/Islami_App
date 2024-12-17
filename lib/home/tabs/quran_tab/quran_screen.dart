import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_details.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_item.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          fileName: "${i + 1}.txt",
          arabicQuranSura: SuraModel.arabicQuranSuraList[i],
          englishQuranSura: SuraModel.englishQuranSuraList[i],
          versesList: SuraModel.versesListList[i]));
    }
  }
   String suraEn="";
   String suraAr="";
   String suraVe="";


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    addSuraList();
    print("SuraModel.suraList.length");
    getData();

  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchContent = '';

  var textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 2));

  var textStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.blackColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/Logo.png"),
            TextField(
              onChanged: (value) {
                searchContent = value;
                print(searchContent);
                setState(() {
                  filterList = SuraModel.suraList.where((SuraModel) {
                    return SuraModel.arabicQuranSura.contains(searchContent) ||
                        SuraModel.englishQuranSura
                            .toLowerCase()
                            .contains(searchContent.toLowerCase());
                  }).toList();
                  print("Filtered List : ${filterList.length}");
                });
              },
              decoration: InputDecoration(
                hintText: "Sura Name",
                hintStyle: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: textFieldBorder,
                enabledBorder: textFieldBorder,
                prefixIcon: Image.asset(
                  "assets/images/quran_ic.png",
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Most Recently",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            searchContent.isNotEmpty
                ? SizedBox()
                : Card(
                    color: AppColors.primaryDark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                suraEn,
                                style: textStyle,
                              ),
                              Text(
                                suraAr,
                                style: textStyle,
                              ),
                              Text(
                                suraVe,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/recentely_item.png")
                      ],
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () async {

                      Navigator.of(context).pushNamed(QuranDetails.routeName,
                          arguments: QuranItem(index + 1, filterList[index]));
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString("suraEn",SuraModel.suraList[index].englishQuranSura);
                      await prefs.setString("suraAr",SuraModel.suraList[index].arabicQuranSura);
                      await prefs.setString("suraVe",SuraModel.suraList[index].versesList);
                      getData();

                    },
                    child: QuranItem(index + 1, filterList[index]));
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 1,
                    indent: 35,
                    endIndent: 35,
                  ),
                );
              },
              itemCount: filterList.length,
            ))
          ],
        ),
      ),
    );
  }
  void getData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    suraEn = prefs.getString('suraEn')??"";
    suraAr = prefs.getString('suraAr')??"";
    suraVe = prefs.getString('suraVe')??"";
    setState(() {

    });
    print('\x1B[35mjjjjjjjjjjjjjjjj$suraVe\x1B[0m');
    print("jjjjjjjjjjjjjjjj$suraVe");
  }
}
