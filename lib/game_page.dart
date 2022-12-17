import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lost_game_word/win_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lose_page.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  final  _keyForm = GlobalKey<FormState>();

  List<String>? list;
  bool  isLoaded = false;
  Future<bool>? _futureData;
  String? word;
  List<Widget> listWidget = <Widget>[];

  final TextEditingController myController = TextEditingController();


  Future<bool> getData()async{

    http.Response response = await http.get(Uri.parse("https://random-word-api.herokuapp.com/word?length=5"));

    var data = json.decode(response.body);

    word = data[0];

    list = word!.split('');

    list?.shuffle();

    return true;

  }


  @override
  void initState() {
    _futureData = getData();
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:FutureBuilder(

          future: _futureData,

          builder: (context,snapshot){

            if (snapshot.hasData) {

              for(int i=0;i<list!.length;i++){

                listWidget.add( Padding(padding:const EdgeInsets.symmetric(horizontal: 6, vertical: 6),child: Text(list![i]+" ",textScaleFactor: 2,textAlign: TextAlign.center,)),);

              }

              return Form(
                key: _keyForm,
              child:SizedBox.expand(

                  child:Column(children: [

                const SizedBox(height: 80,),

                const Text("The letters are :",textScaleFactor: 2,),

                Row(mainAxisAlignment:MainAxisAlignment.center,children: listWidget,),

                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text('Guess the word', textScaleFactor: 2,)
                ),

                Container(
                  padding:const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: myController,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),

                  ),


                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100,50)),
                    onPressed:()async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("WORD",word.toString());

                      if(myController.text==word) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WinPage()),
                        );
                      }else{

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LosePage()),
                        );
                      }
                    },
                    child:const Text("Submit",textScaleFactor: 1.5,)
                ),

              ],
                  ),
              ),
              );
            }

            else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.purple),
              );
            }
          }
      ),);
  }
}
