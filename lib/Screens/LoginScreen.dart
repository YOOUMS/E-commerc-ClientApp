import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                          "Login",
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
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero, isDense: true),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: null,
                              child: Text("Forgot passcode?",
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 89, 86, 233),
                                        fontSize: 15.sp),
                                  )))),
                      SizedBox(
                        height: 44.sp,
                      ),
                      InkWell(
                        onTap: null,
                        child: Container(
                            width: 314.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 89, 86, 233),
                                borderRadius: BorderRadius.circular(10.r)),
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
                          onPressed: null,
                          child: Text("Create account",
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 89, 86, 233),
                                    fontSize: 17.sp),
                              )))
                    ]),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
