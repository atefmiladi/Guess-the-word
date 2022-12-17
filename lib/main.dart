import 'package:flutter/material.dart';
import 'package:lost_game_word/arabic_game_page.dart';
import 'package:lost_game_word/language_page.dart';
import 'package:lost_game_word/nav_tab.dart';
import 'package:lost_game_word/win_page.dart';

import 'direction_page.dart';
import 'game_page.dart';
import 'home_page.dart';
import 'lose_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
        routes: {
          "/":(context){return const NavigationTab();},
          "/home_page":(context){ return const HomePage();},
          "/direction_page":(context){ return const DirectionPage();},
          "/game_page":(context){ return const GamePage();},
          "/win_page":(context){ return const WinPage();},
          "/lose_page":(context){ return const LosePage();},
          "/language_page":(context){ return const LanguagePage();},
          "/arabic_game_page":(context){ return const ArabicGamePage();}

        }
    );
  }
}
