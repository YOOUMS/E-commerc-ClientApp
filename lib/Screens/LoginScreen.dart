import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/ForgotPasswordScreen.dart';
import 'package:e_commerce_app/Screens/signUp.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'LoadingSpinner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DBprovider>(builder: (context, provider, x) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 89, 86, 233),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Text(
                          "Welcome back",
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 36.h),
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
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
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
                                controller: provider.emailControllerLogin,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    isDense: true),
                              ),
                              SizedBox(
                                height: 44.sp,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/Lock.png'),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text("Password")
                                ],
                              ),
                              TextFormField(
                                controller: provider.passwordControllerLogin,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    isDense: true),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: TextButton(
                                      onPressed: () => AppRouter.pushWidget(
                                          ForgotPasswordScreen()),
                                      child: Text("Forgot passcode?",
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                            textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 89, 86, 233),
                                                fontSize: 15.sp),
                                          )))),
                              SizedBox(
                                height: 44.sp,
                              ),
                              InkWell(
                                onTap: () => provider.signIn(),
                                child: Container(
                                    width: 314.w,
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 89, 86, 233),
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ))),
                              ),
                              TextButton(
                                  onPressed: () => AppRouter.pushWithReplacment(
                                      SignUpScreen()),
                                  child: Text("Create account",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 89, 86, 233),
                                            fontSize: 17.sp),
                                      )))
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              !provider.isLoaded
                  ? Center(child: LoadingSpinner())
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ));
    });
  }
}
