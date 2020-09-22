import 'package:flutter/material.dart';

/// Wraps the [child] with ScrollView if the screen is too small to fit the contents inside,
///   otherwise lets the content expand.
class ConstrainedFlexView extends StatelessWidget {
  const ConstrainedFlexView(
    this.minSize, {
    Key key,
    this.child,
    this.axis,
  }) : super(key: key);

  final Widget child;
  final double minSize;
  final Axis axis;

  bool get isHz => axis == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double viewSize = isHz ? constraints.maxWidth : constraints.maxHeight;

        /// Returns the child itself back if the screen is big enough.
        if (viewSize > minSize) {
          return child;
        }

        /// Wraps the child with ScrollView if the screen is not big enough.
        return SingleChildScrollView(
          scrollDirection: axis ?? Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: isHz ? double.infinity : minSize,
                maxWidth: isHz ? minSize : double.infinity),
            child: child,
          ),
        );
      },
    );
  }
}
