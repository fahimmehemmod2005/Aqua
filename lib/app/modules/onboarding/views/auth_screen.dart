import 'package:aqua/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(height: 227.h),
          SvgPicture.asset(
            'assets/icons/logo1.svg',
            height: 68.h,
            width: 57.w,
          ),
      
          SizedBox(height: 60.h),
          Text(
            "Lets Get Started!",
            textAlign: TextAlign.center,
            style: GoogleFonts.playfair(
              fontWeight: FontWeight.w700,
              fontSize: 30.sp,
              color: Color(0xff404040),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Care for every step of your journey",
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 247),
          SizedBox(
            height: 41.h,
            width: double.infinity,
            child: CustomButton(
              onpress: () {},
              child: Text(
                'Sign up',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: SizedBox(
              height: 41.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100]
                ),
                onPressed: () => Get.offAllNamed('/login'),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff369FFF)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
