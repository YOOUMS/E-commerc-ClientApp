import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
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
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 36.h),
                  width: 414.w,
                  height: 600.h,
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
                          "Sign up",
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
                            .emailControllerSignup,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
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
                        controller: Provider.of<DBprovider>(context)
                            .passwordControllerSignup,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
                      ),
                      SizedBox(
                        height: 44.h,
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
                        controller: Provider.of<DBprovider>(context)
                            .userNameControllerSignup,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
                      ),
                      SizedBox(
                        height: 44.sp,
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
                        controller: Provider.of<DBprovider>(context)
                            .phoneControllerSignup,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: () =>
                                  AppRouter.pushWithReplacment(LoginScreen()),
                              child: Text("already have account?",
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 89, 86, 233),
                                        fontSize: 15.sp),
                                  )))),
                      SizedBox(
                        height: 0.h,
                      ),
                      InkWell(
                        onTap: () =>
                            Provider.of<DBprovider>(context, listen: false)
                                .signUp(),
                        child: Container(
                            width: 314.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 89, 86, 233),
                                borderRadius: BorderRadius.circular(10.r)),
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
              )
            ],
          ),
        ));
  }
}
