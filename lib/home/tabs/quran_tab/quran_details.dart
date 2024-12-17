import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_item.dart';

class QuranDetails extends StatefulWidget{
  static const String routeName="QuranDetails";

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
   String content="";

  var textStyle=TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.primaryDark
  );

  @override
  Widget build(BuildContext context) {
    var quranItem=ModalRoute.of(context)?.settings.arguments as QuranItem;
    if(content==""){
      loadQuranContentFromFiels(quranItem.index);

    }
    print(content);

    return
      Scaffold(
      appBar: AppBar(
        title: Text(quranItem.suraModel.englishQuranSura,),
      ),
      body:
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/quran_content_bg.png"),
                fit: BoxFit.fill)),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(quranItem.suraModel.arabicQuranSura,style: textStyle,),
            ),
            Expanded(child:
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              children: [
                Text("$content", style: textStyle,
                    textDirection: TextDirection.rtl)

            ]))],
        ),
      ),
    );

  }

  void loadQuranContentFromFiels(int index)async{
    String suraContent=await rootBundle.loadString('assets/files/quran/$index.txt');
    setState(() {

      //content=suraContent;

      List<String> lines = suraContent.split('\n').where((line) => line.trim().isNotEmpty).toList();
      content = lines.asMap().entries.map((entry) {
        int index =entry.key+1; // Line index (1-based)
        String line = entry.value.trim(); // Line content
        return "[$index] $line";
      }).join(' ');
      print(content);
    });

  }
  void formatContent(){

  }
}