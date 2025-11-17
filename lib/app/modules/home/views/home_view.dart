import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key,});
  @override
  Widget build(BuildContext context) {
    var passMl = Get.parameters['passMlLavel'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff404040),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            Center(
              child: Text(
                'Today i still need to drink',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Color(0xff404040),
                ),
              ),
            ),
            Text('$passMl ml',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Color(0xff404040),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
