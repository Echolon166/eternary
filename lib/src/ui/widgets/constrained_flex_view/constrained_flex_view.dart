import 'package:flutter/material.dart';

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
        if (viewSize > minSize) return child;
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
