import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 89, 86, 233),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Text(
            "Find your Gadget",
            style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    fontSize: 65.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 89, 86, 233),
                Color.fromARGB(36, 100, 80, 255),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [0, 0.5],
            ),
          ),
          width: 486.w,
          height: 486.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/SplachImage.png'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 39.h,
        ),
        InkWell(
          onTap: null,
          child: Container(
              width: 314.w,
              height: 70.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Get started",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 89, 86, 233)),
                  ))),
        )
      ])),
    );
  }
}
