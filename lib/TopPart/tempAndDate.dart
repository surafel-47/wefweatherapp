// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wefweatherapp/MyDatas.dart';
import 'package:provider/provider.dart';

class TempAndDate extends StatelessWidget {
  double scrW = 0, scrH = 0;
  @override
  Widget build(BuildContext context) {
    final myDatas = Provider.of<MyDatas>(context, listen: true);

    scrW = MediaQuery.of(context).size.width;
    scrH = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          ("${myDatas.temp.toStringAsFixed(1)}°"),
          style: TextStyle(color: Colors.white, fontSize: scrH * 0.13),
        ),
        Text(
          myDatas.desc
              .split(' ')
              .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
              .join(' '),
          style: GoogleFonts.playfairDisplay(
              color: Colors.white, fontSize: scrH * 0.04),
        ),
        Text(
          myDatas.dayFormated,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5), fontSize: scrH * 0.024),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Container(
            width: scrW * 0.7,
            height: 1,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            smallCards(scrW, scrH, "Wind", ("${myDatas.wind.toInt()}km/h"),
                Icons.wind_power),
            smallCards(scrW, scrH, "Humidity", "${myDatas.humidity.toInt()}%",
                Icons.water_drop_outlined),
            smallCards(
                scrW, scrH, "Rain", "${myDatas.rain.toInt()}%", Icons.waves),
          ],
        )
      ],
    );
  }
}

Widget smallCards(
    double scrW, double scrH, String title, String data, IconData icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: scrW * 0.07,
        color: Colors.white,
      ),
      Text(
        data,
        style: TextStyle(fontSize: scrW * 0.04, color: Colors.white),
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: scrW * 0.03,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    ],
  );
}
