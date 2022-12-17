import 'package:flutter/material.dart';
import 'home_page.dart';


class NavigationTab extends StatelessWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 1,

        child: Scaffold(

          appBar: AppBar(

            backgroundColor: Colors.deepOrange,

            title: const Text("Parameters"),

          ),

          drawer: Drawer(

              child : Column(


                children: [

                  Container(

                    height: 200,
                    width: double.infinity,

                    color: Colors.purple,

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        SizedBox(height: 25,),
                         Padding(padding:EdgeInsets.only(left: 10)    ,child: CircleAvatar(backgroundImage: AssetImage('assets/kilma.jpg'),radius: 50,),),
                         SizedBox(height: 1,),
                         Padding(padding: EdgeInsets.only(left: 10),child:Text("الكلمة المفقودة",textScaleFactor: 1.5,style: TextStyle(color: Colors.white),)),
                         SizedBox(height: 5,),
                         Padding(padding: EdgeInsets.only(left: 10),child:Text("The lost word",textScaleFactor: 1.5,style: TextStyle(color: Colors.white),)),

                      ],

                    ) ,

                  ),

                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.cable,color: Colors.deepOrange),
                          SizedBox(width: 20,),
                          Text("highest score",textScaleFactor: 1.2,)

                        ]

                    ),

                  ),
                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.info,color: Colors.deepOrange,),
                          SizedBox(width: 20,),
                          Text("info",textScaleFactor: 1.2,)

                        ]

                    ),

                  ),
                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.language,color: Colors.deepOrange,),
                          SizedBox(width: 20,),
                          Text("Language",textScaleFactor: 1.2,)

                        ]

                    ),

                    onTap: (){
                      Navigator.pushReplacementNamed(context, "/language_page");
                    },
                  ),
                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.cable,color: Colors.deepOrange,),
                          SizedBox(width: 20,),
                          Text("2 players",textScaleFactor: 1.2,)

                        ]

                    ),

                  ),
                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.cable,color: Colors.deepOrange,),
                          SizedBox(width: 20,),
                          Text("categories",textScaleFactor: 1.2,)

                        ]

                    ),

                  ),
                  ListTile(

                    title: Row(

                        children:const [

                          Icon(Icons.cancel,color: Colors.deepOrange,),
                          SizedBox(width: 20,),
                          Text("close",textScaleFactor: 1.2,)

                        ]
                    ),
                  ),
                ],
              )
          ),

          body:const TabBarView(
            children: [HomePage()],
          ),
        )
    );
  }
}
