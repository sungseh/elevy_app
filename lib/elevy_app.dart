import 'package:elevy_app/home_page.dart';
import 'package:flutter/material.dart';

class ELevyApp extends StatelessWidget {
  const ELevyApp({ Key? key }) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        title: 'Flutter Demo Home Page'
      ),
    );
  }
}
 