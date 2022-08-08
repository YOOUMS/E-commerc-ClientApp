import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/HomePage.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmptyScreenOrderHistory extends StatelessWidget {
  const EmptyScreenOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 104.h),
        Image.asset('assets/EmptyOrderHistory.png'),
        Text("No History yet",
            style: GoogleFonts.raleway(
                textStyle:
                    TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600))),
        SizedBox(
          height: 17.h,
        ),
        SizedBox(
            width: 217.w,
            child: Text(
              "Hit the orange button down below to Create an order",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      fontSize: 17.sp, color: Colors.black.withOpacity(.57))),
            )),
        SizedBox(
          height: 29.h,
        ),
        InkWell(
          onTap: () => AppRouter.pushWithReplacment(HomePage()),
          child: Container(
              width: 224.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 88, 192, 234),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Start ordering",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
        ),
      ]),
    );
  }
}
