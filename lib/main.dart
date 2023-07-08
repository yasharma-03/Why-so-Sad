import 'package:flutter/material.dart';
import 'package:why_so_sad/view/MainScreen.dart';
import 'package:why_so_sad/view/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplash = true;
  showSplashScreen(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  void initState() {
    showSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnSad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  showSplash ? splashScreen() : Mainscreen(),
    );
  }
}

