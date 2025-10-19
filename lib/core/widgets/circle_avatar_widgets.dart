import 'package:flutter/material.dart';

class CircleAvatarWidgets extends StatelessWidget {
  final Color? backgroundColor;
  final double? maxRadius;
  final double? minRadius;
  final IconData? icon;
  final double? radius;
  final Color? color;
  final double? size;

  const CircleAvatarWidgets({super.key, this.icon, this.backgroundColor, this.maxRadius, this.minRadius, this.color, this.size, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,

      maxRadius: maxRadius,
      minRadius: minRadius,
      child: Icon(icon, size: size , color: color,),

      //Icons.person , size: 60, color: AppColor.avatarColor,
    );
  }
}
