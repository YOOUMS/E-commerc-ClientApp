import 'package:e_commerce_app/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 34.h),
      height: 350.h,
      width: 220.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: 220.w,
                  height: 270.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 39.h,
                        ),
                        Text(
                          product.name,
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          product.descraption,
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 134, 134, 134),
                                  fontSize: 16.sp)),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          '\$' + product.price.toString(),
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 89, 86, 233),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                        )
                      ]),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 160.h),
                    width: 157.w,
                    height: 157.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        image: DecorationImage(
                            image: AssetImage(product.imagePath),
                            fit: BoxFit.cover)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
