import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WinPage extends StatefulWidget {

  const WinPage({Key? key}) : super(key: key);

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {

  late String? word;

  late Future<bool> fetchedWord;

  Future<bool> fetchWord()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    word = prefs.getString("WORD").toString();

    return true;
  }


  @override
  void initState() {
    // TODO: implement initState

    fetchedWord =fetchWord();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return FutureBuilder(

    future: fetchedWord,

        builder: (context,snapshot) {
          return Scaffold(

            body: SizedBox.expand(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Icon(Icons.thumb_up, color: Colors.green, size: 150,),
                  const SizedBox(height: 20,),
                  const Text("You Win", textScaleFactor: 3,
                    style: TextStyle(color: Colors.purple),),
                  const SizedBox(height: 20,),
                  Text("the word is $word", textScaleFactor: 1.5,
                    style: const TextStyle(color: Colors.purple),),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          minimumSize: const Size(100, 50)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/direction_page');
                      },
                      child: const Text("Play Again", textScaleFactor: 1.5,)),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          minimumSize: const Size(100, 50)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text("Main menu", textScaleFactor: 1.5,)),

                ],

              ),

            ),
          );
        }

    );
  }
}
