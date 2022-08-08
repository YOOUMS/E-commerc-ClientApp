import 'package:e_commerce_app/Screens/EmptyScreen.dart';
import 'package:e_commerce_app/data/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        title: Text(
          "Favorites",
          style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
      ),
      body: EmptyScreen(),
    );
  }
}
