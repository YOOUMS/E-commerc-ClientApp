import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:e_commerce_app/providers/methodProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DBprovider>(builder: (context, provider, x) {
      return Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 89, 86, 233),
          body: SingleChildScrollView(
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
                      "Create account",
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
                    key: provider.signUpKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.w, vertical: 36.h),
                      width: 414.w,
                      height: 600.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r))),
                      child: Align(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Sign up",
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
                                Icon(
                                  Icons.perm_identity_outlined,
                                  color: Color.fromARGB(255, 134, 134, 134),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text("User Name")
                              ],
                            ),
                            TextFormField(
                              validator: (value) {
                                return provider.userNameValid(value!);
                              },
                              controller: provider.userNameControllerSignup,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true),
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
                              validator: (value) {
                                return provider.emailValidate(value!);
                              },
                              controller: provider.emailControllerSignup,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
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
                              validator: (value) {
                                return provider.passwordValid(value!);
                              },
                              controller: provider.passwordControllerSignup,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true),
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_android_outlined,
                                  color: Color.fromARGB(255, 134, 134, 134),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text("Phone")
                              ],
                            ),
                            TextFormField(
                              validator: (value) {
                                return provider.emptyValidate(value);
                              },
                              controller: provider.phoneControllerSignup,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                    onPressed: () =>
                                        AppRouter.pushWithReplacment(
                                            LoginScreen()),
                                    child: Text("already have account?",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 89, 86, 233),
                                              fontSize: 15.sp),
                                        )))),
                            SizedBox(
                              height: 0.h,
                            ),
                            InkWell(
                              onTap: () => provider.signUp(),
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
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ))),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
