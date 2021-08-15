import 'package:flutter/material.dart';
//import 'package:womentr/screens/LoginScreen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),      
    );
  }
}