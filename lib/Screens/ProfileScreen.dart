import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "My profile",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 34.sp, fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Container(
                child: SizedBox(
                  height: 190.h,
                  width: 315.w,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      margin: EdgeInsets.only(top: 23.h),
                      width: 315.w,
                      height: 167.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                          child: Column(children: [
                        SizedBox(
                          height: 63.h,
                        ),
                        Text(
                          Provider.of<DBprovider>(context).user!.userName!,
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 18.w,
                            ),
                            SizedBox(
                              width: 182.w,
                              child: Text(Provider.of<DBprovider>(context)
                                          .user!
                                          .address ==
                                      null
                                  ? "No Address Found \n Edit Your Profile"
                                  : "Address: ${Provider.of<DBprovider>(context).user!.address}"),
                            )
                          ],
                        )
                      ])),
                    ),
                    Container(
                      width: 76.w,
                      height: 76.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          image: DecorationImage(
                              image: AssetImage('assets/user.jpg'),
                              fit: BoxFit.cover)),
                    )
                  ]),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.h,
                  width: 315.w,
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(children: [
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.w,
                    )
                  ]),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.h,
                  width: 315.w,
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(children: [
                    Text(
                      "Shopping address",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.w,
                    )
                  ]),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.h,
                  width: 315.w,
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(children: [
                    Text(
                      "Order history",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.w,
                    )
                  ]),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.h,
                  width: 315.w,
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(children: [
                    Text(
                      "Cards",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.w,
                    )
                  ]),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.h,
                  width: 315.w,
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(children: [
                    Text(
                      "Notifications",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.w,
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
