// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  final void Function()? onPressed;
  final ButtonStyle? style;
  final Widget? child;

  const NextButton({
    super.key,
    this.onPressed,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed, 
       style: style,
       child: child,
        ),
    );
  }
}
