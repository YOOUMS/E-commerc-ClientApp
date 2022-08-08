import 'package:e_commerce_app/Widgets/ProductInCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: ProuductInCart(),
      ),
    );
  }
}
