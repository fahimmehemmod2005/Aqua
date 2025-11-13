import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final Function()? onpress;
  final Color color;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.child,
    required this.onpress,
    this.color = const Color(0xff369FFF),
    this.borderRadius = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            elevation: 0,
          ),
          onPressed: onpress,
          child: child,
        ),
    );
  }
}
