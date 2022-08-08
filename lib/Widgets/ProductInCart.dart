import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProuductInCart extends StatelessWidget {
  const ProuductInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314.w,
      height: 130.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Row(children: [Image.asset('assets/products/ProductBasket.png')]),
    );
  }
}
