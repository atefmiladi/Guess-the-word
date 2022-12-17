import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      body:SizedBox.expand(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            ElevatedButton(

              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100,50)),

              onPressed: ()async{

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("LANG", "ar");

                Navigator.pushNamed(context, '/');

              }, child:const Padding(

                padding: EdgeInsets.all(5),

                child:Text("Arabic Language",textScaleFactor: 1.5,)),

            ),


            const SizedBox(height: 50,),

            ElevatedButton(

              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100,50)),

              onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("LANG", "en");
                Navigator.pushNamed(context, '/');

              }, child:const Padding(

                padding: EdgeInsets.all(5),

                child:Text("English language",textScaleFactor: 1.5,)),

            ),

          ],

        ),

      ),

    );
  }
}
