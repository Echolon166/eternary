import 'package:eternary/src/ui/screens/layout_template.dart/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/centered_view/centered_view.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      home: CenteredView(
        child: LayoutTemplate(),
      ),
    );
  }
}
