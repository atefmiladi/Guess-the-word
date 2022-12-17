import 'package:flutter/material.dart';
import 'package:lost_game_word/arabic_game_page.dart';
import 'package:lost_game_word/game_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DirectionPage extends StatefulWidget {
  const DirectionPage({Key? key}) : super(key: key);

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {

  late bool verify;
  late Future<bool> fetchedLanguage;

  Future<bool> fetchLanguage() async {



    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("LANG").toString()=="en") {
      verify = true;
    } else {
      verify= false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchedLanguage = fetchLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchedLanguage,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {

                if(verify==true){return const GamePage();}
                else{return const ArabicGamePage();}

                } else {
                return const Center(

                  child: CircularProgressIndicator(),

                );
              }
            }));

  }
}
