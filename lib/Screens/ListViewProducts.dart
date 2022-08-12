import 'package:e_commerce_app/Widgets/ProductWidget.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ListViewProduct extends StatelessWidget {
  List<Product> products;
  ListViewProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductWidget(product: products[index]))
        : Lottie.asset(
            'assets/animation/NoProducts.json',
          );
  }
}
