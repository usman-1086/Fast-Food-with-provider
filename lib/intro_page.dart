import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0,right: 40,bottom: 40,top: 100),
            child: Image.asset('images/intro.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Best fast food restaurant in town',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          Spacer(),

          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.all(20),
              child: Text('Get Started',style: TextStyle(color: Colors.white),),
            ),
          ),

          Spacer(),

        ],
      ),
    );
  }
}
