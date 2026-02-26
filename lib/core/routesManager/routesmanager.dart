import 'package:flutter/material.dart';
import 'package:news/main.dart';

import '../../Sreen.dart';
import '../../chapterone.dart';
import '../../coures2.dart';
import '../../courseDetailsScreen.dart';
import '../../courseScreen.dart';
import '../../firstscreeen.dart';
import '../../screen.dart';
import '../../speech.dart';
import '../../vedioScreen.dart' hide VideoScreen;
import 'package:news/vedioScreen.dart' hide VideoScreen;
class RoutesManager {
  static const String firstScreen = "/firstScreen";
  static const String onBoarding = "/onBoarding";
  static const String mainLayout = "/mainLayout";
  static const String suraDetails = "/suraDetails";
  static const String VideoFromLinkscreen = "/VideoFromLinkScreen";
  static const String courseScreen ="/courseScreen";
  static const String muiltilang = "/VideoPlayerWithSubtitles";
  static const String courseDetails= "/courseDetails";
  static const String vedio2="/CoursePage";
  //static const String Lessonscreen="/Lessonpage";

  static Map<String, WidgetBuilder> routes = {
    firstScreen : (context) => FirstScreen(),
    //json:(context)=>JsonScreen(),
   muiltilang:(context)=> Editprofile(),
    VideoFromLinkscreen: (context) => VideoFromLinkScreen(),
    courseScreen: (context) => CoursesScreen(),
    //Lessonscreen:(context)=> LessonScreen(),
        vedio2:(context)=>                 CoursePage(),
  };

}