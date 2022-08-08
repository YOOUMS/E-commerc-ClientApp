import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/DBprovider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 89, 86, 233),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  "Forgot password",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 65.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 62.h,
              ),
              Form(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 36.h),
                  width: 414.w,
                  height: 590.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Align(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 44.sp,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/Email.png'),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text("Email")
                        ],
                      ),
                      TextFormField(
                        controller: Provider.of<DBprovider>(context)
                            .emailControllerLogin,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
                      ),
                      SizedBox(
                        height: 44.sp,
                      ),
                      InkWell(
                        onTap: () =>
                            Provider.of<DBprovider>(context, listen: false)
                                .resetPassword(),
                        child: Container(
                            width: 314.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 89, 86, 233),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Reset",
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
