import 'package:flutter/material.dart';
import 'package:lost_game_word/direction_page.dart';



class HomePage  extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body:SizedBox.expand(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            const Text("لعبة",textScaleFactor: 3,style: TextStyle(color: Colors.black),),

            const SizedBox(height: 20,),

            const Text("الكلمة المفقودة",textScaleFactor: 3,style: TextStyle(color: Colors.black),),

            const SizedBox(height: 20,),

            const Text("The lost word",textScaleFactor: 3,style: TextStyle(color: Colors.purple),),

            const SizedBox(height: 50,),

            ElevatedButton(

              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100,50)),

              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DirectionPage()),
                );
              }, child:const Padding(

                padding: EdgeInsets.all(5),

                child:Text("Start",textScaleFactor: 1.5,)),

            ),

          ],

        ),

      ),

    );
  }
}
