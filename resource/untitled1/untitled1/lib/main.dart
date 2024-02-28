import 'package:flutter/material.dart';
import 'package:untitled1/Screens/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(),
      title: 'Flutter Demo',
    );
  }
}


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 150,
            ),
            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {return ListPage();} ));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPage()));
                    },
                    child: Text("Start Shopping",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 55,vertical: 20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                  )

                  ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  color: Colors.white,
                  elevation: 5,
                  child: InkWell(
                    onTap: (){
                      print("asfasfafasf");
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55,vertical: 10),
                      child: Text(
                          "Start Shopping",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                      ),
                    ),
                  ),
                ),
              ],
            ),

            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add)
            ),

            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),
            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),
            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),
            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),
            Text(
              "The store of your\ndreams.You will find\nhere what you need",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 130,
            ),


          ],
        ),
      ),
    );
  }
}

