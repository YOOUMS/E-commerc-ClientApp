import 'dart:developer';
import 'dart:ffi';

import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/ProductPage.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInFavorite extends StatelessWidget {
  Product product;
  ProductInFavorite({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log(product.id ?? "No id");
        AppRouter.pushWidget(ProductPage(product: product));
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        width: 314.w,
        height: 130.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: Row(children: [
          Image.asset(product.imagePath),
          SizedBox(
            width: 9.w,
          ),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  product.name,
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "\$ ${product.price}",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 89, 86, 233),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
