import 'package:flutter/material.dart';

class ClickableContainer extends StatelessWidget {
  const ClickableContainer({
    super.key,
    this.child,
    this.color,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.width,
    this.height,
    this.decoration,
    this.alignment,
    this.transform,
    this.clipBehavior = Clip.none,
    this.onTap, this.borderRadius,
  });

  final Widget? child;
  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final Matrix4? transform;
  final Clip clipBehavior;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: padding,
          width: width,
          height: height,
          decoration: decoration,
          alignment: alignment,
          transform: transform,
          clipBehavior: clipBehavior,
          child: child,
        ),
      ),
    );
  }
}