import 'package:flutter/material.dart';

/// Adds hover effect and converts mouse pointer
///   into a cursor when it is on top of the [child].
/// [onPressed] is called when the [child] is clicked.
class ClickableButton extends StatelessWidget {
  const ClickableButton({
    Key key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: child,
      onPressed: onPressed,
    );
  }
}

/// Converts mouse pointer into a cursor when it is on top of the [child].
/// [onTap] is called when the [child] is clicked.
class ClickableInkwell extends StatelessWidget {
  const ClickableInkwell({
    Key key,
    this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
      onTap: onTap,
    );
  }
}
