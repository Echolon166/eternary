import 'package:flutter/material.dart';

/// Limits the width of the [child] to a maximum size.
/// This keeps the content in the center and
///   prevents it from sticking to corners of the screen.
class CenteredView extends StatelessWidget {
  const CenteredView({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
