import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.network("https://th.bing.com/th/id/OIP.wZSElpa92SSl0joMTscQnwHaIK?pid=ImgDet&rs=1"),
          SizedBox(height: 50,),
            Text("Why so Sad!!!", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        ],)
        ,),
    );
  }
}
