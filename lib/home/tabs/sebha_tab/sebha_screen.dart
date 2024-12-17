import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    " الله اكبر ",
    "لا حول ولا قوه الا بالله"
  ];
  int counter = 33;
  String zeker="سبحان الله";
  int currentAzkarIndex = 0;

  var textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36);
  double _angle = 0.0; // Rotation angle in degrees

  void _rotateImage() {
    setState(() {
      _angle += (2 * 3.14159) / 33; // Increment the angle (360° = 2π radians)
      if (_angle >= 2 * 3.14159) {
        _angle = 0;
      }});
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Image.asset("assets/images/Logo.png"),
          SizedBox(
            height: 16,
          ),
          Image.asset("assets/images/logo_azkar.png"),
          SizedBox(
            height: 16,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor:Colors.transparent ,
            onTap: () {
              HapticFeedback.vibrate();
              SystemSound.play(SystemSoundType.alert);
              _rotateImage();
              changeAzkar();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(

                children: [
                  Image.asset("assets/images/sebha_rotate.png",fit: BoxFit.fill,),
                Transform.rotate(
                    angle: _angle,
                    child: Image.asset(
                      "assets/images/sebha_body.png",
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$zeker",
                        style: textStyle,
                      ),
                      Text(
                        "$counter",
                        style: textStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
  void changeAzkar(){

    counter--;  // Decrease counter by 1 on each tap
    if (counter <= 0) {

      currentAzkarIndex = (currentAzkarIndex + 1) % azkar.length;  // Wrap around when reaching end of list
      counter = 33;  // Reset the counter
    }
    zeker = azkar[currentAzkarIndex];


  }
}
