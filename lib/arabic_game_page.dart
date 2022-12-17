import 'package:flutter/material.dart';
import 'package:lost_game_word/win_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lose_page.dart';



class ArabicGamePage extends StatefulWidget {
  const ArabicGamePage({Key? key}) : super(key: key);

  @override
  State<ArabicGamePage> createState() => _ArabicGamePageState();
}

class _ArabicGamePageState extends State<ArabicGamePage> {

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  List<String> list = ["كتاب","كتاب","كتاب"];

  String? word;
  List<Widget> listWidget = <Widget>[];
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    list.shuffle();

    word=list[0];

    print(word);

   var str = word!.split('');

    str?.shuffle();

    for(int i=0;i<str.length;i++){

      listWidget.add( Padding(padding:const EdgeInsets.symmetric(horizontal: 6, vertical: 6),child: Text(str[i]+" ",textScaleFactor: 2,textAlign: TextAlign.center,)),);

    }

              return Form(

                  key:_keyForm,

                  child:SizedBox.expand(

                child:Column(children: [

                  const SizedBox(height: 80,),

                  const Text("الحروف هي :",textScaleFactor: 2,),

                  Row(mainAxisAlignment:MainAxisAlignment.center,children: listWidget,),

                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      child: Text('خمن الكلمة', textScaleFactor: 2,)
                  ),
               Directionality(textDirection: TextDirection.rtl,
                 child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: TextField(
                       onTap: (){

                         validator: (String? value) {
                           if (value == null || value.isEmpty) {
                             return 'Please enter some text';
                           }
                           return null;
                         };

                       },
                      cursorColor: Colors.purple,
                      textAlign: TextAlign.right,
                      controller: myController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                        hintText: 'اكتب الاجابة',

                      ),

                    ),
                  ),
                  ),
                  const SizedBox(height: 10,),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100,50)),
                      onPressed:()async{

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("WORD",word.toString());
                        print(word.toString());
                        print(myController.text);

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
}
