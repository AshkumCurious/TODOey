import 'package:flutter/material.dart';
import 'package:todoey/auth/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() async{

  //initialising hive
  await Hive.initFlutter();

  //opening a box
  var box = await Hive.openBox('mybox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: EasySplashScreen(
        logo: Image.asset('lib/images/TODOEY_logo_withoutBG.png',
        ),
        logoWidth: 200.0,
        backgroundColor: Colors.deepPurple.shade400,
        showLoader: true,
        loadingText: Text("Loading..."),
        navigator: LoginPage(),
        durationInSeconds: 2,
      ),
      theme: ThemeData(primarySwatch:Colors.deepPurple),
    );
  }
}
