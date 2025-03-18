import 'package:flutter/material.dart';
import 'color.dart';

ThemeData Ten = ThemeData(

  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: ColorApp.secandryColor),
    color: ColorApp.bacground,
    centerTitle: true,
  ),

  /////////////////////////////////////////////////////////////////////////////////////
  textTheme: const TextTheme(
    //th1
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "Genos",
        fontSize: 30,
        color: ColorApp.blackdark),

    //th2
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Genos",
      fontSize: 20,
      color: ColorApp.blacklight,
      height: 1.5,
    ),
    //th3
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Genos",
      fontSize: 20,
      color: ColorApp.bacground,
      height: 1.5,
    ),
    //th4
    bodySmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "NotoKufiArabic",
      fontSize: 15,
      color: ColorApp.blacklight,
      height: 1.5,
    ),
  ),

);

//******************************************************************************************************************************************************
ThemeData Tar = ThemeData(

/////////////////////////////////////////////////////////////////////////////////////
  textTheme: const TextTheme(
//th1
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "NotoKufiArabic",
        fontSize: 30,
        color: ColorApp.blackdark),

//th2
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "NotoKufiArabic",
      fontSize: 20,
      color: ColorApp.blacklight,
      height: 1.5,
    ),
//th3
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "NotoKufiArabic",
      fontSize: 20,
      color: ColorApp.bacground,
      height: 1.5,
    ),
//th4
    bodySmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "NotoKufiArabic",
      fontSize: 15,
      color: ColorApp.blacklight,
      height: 1.5,
    ),

  ),
);
