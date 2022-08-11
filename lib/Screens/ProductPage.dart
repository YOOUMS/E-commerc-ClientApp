import 'package:e_commerce_app/Screens/ForgotPasswordScreen.dart';
import 'package:e_commerce_app/Screens/signUp.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:e_commerce_app/providers/methodProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../AppRouter/AppRouter.dart';
import '../providers/DBprovider.dart';

class ProductPage extends StatelessWidget {
  Product product;
  ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<MethodProvider>(context, listen: false)
                        .CheckFavoriteState(product.id!)
                    ? Provider.of<FireStoreProvider>(context, listen: false)
                        .removeFromFavorites(product.id!)
                    : Provider.of<FireStoreProvider>(context, listen: false)
                        .addProductToFavorites(product.id!);
              },
              icon: Icon(Icons.favorite_rounded),
              color: Provider.of<FireStoreProvider>(context)
                      .checkFavorite(product.id!)
                  ? Colors.red
                  : Colors.black,
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 270.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      height: 230.h,
                      width: 260.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/products/p2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      height: 230.h,
                      width: 260.w,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(1),
                          image: DecorationImage(
                              image: AssetImage("assets/products/p1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      height: 230.h,
                      width: 260.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/products/p3.jpg"),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 36.h),
                  width: 414.w,
                  height: 503.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Align(
                    child: Column(children: [
                      SizedBox(
                          width: double.infinity,
                          child: Text(
                            "${product.name}",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold)),
                          )),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Description",
                            style: GoogleFonts.raleway(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          )),
                      Divider(),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "${product.descraption}",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(fontSize: 15.sp)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.raleway(fontSize: 17.sp),
                          ),
                          Spacer(),
                          Text(
                            "\$ ${product.price}",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 89, 86, 233),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      InkWell(
                        onTap: () =>
                            Provider.of<DBprovider>(context, listen: false)
                                .signIn(),
                        child: Container(
                            width: 314.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 89, 86, 233),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Add to basket",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
