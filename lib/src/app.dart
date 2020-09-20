import 'package:eternary/src/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/centered_view.dart/centered_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eternary',
      home: Scaffold(
        body: CenteredView(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
