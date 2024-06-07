import 'package:flutter/material.dart';




class BuildProfileCircle extends StatelessWidget {
  const BuildProfileCircle({
    super.key,
    required this.w, required this.color, this.onTap, required this.child,
  });

  final double w;
  final Color color;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: w,
        width: w ,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: child,
      ),
    );
  }
}