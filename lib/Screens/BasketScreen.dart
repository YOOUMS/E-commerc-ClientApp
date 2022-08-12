import 'package:e_commerce_app/Widgets/ProductInBasket.dart';
import 'package:e_commerce_app/Widgets/ProductInFavorite.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/methodProvider.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        elevation: 0,
        title: Text(
          "Basket",
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Container(
                height: 600.h,
                child: ListView.builder(
                    itemCount: provider.basketProducts.length,
                    itemBuilder: (context, index) => ProductInBasket(
                        product: provider.basketProducts[index])),
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
                    "\$ ${Provider.of<MethodProvider>(context).getBasketPrice()}",
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
                child: Container(
                    width: 314.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 89, 86, 233),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CheckOut",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
              ),
            ],
          ),
        );
      }),
    );
  }
}
