import 'package:eternary/src/ui/views/layout_template.dart/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

/// Entry point of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      home: LayoutTemplate(),
    );
  }
}
