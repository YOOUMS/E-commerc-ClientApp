import 'package:e_commerce_app/Screens/LoadingSpinner.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:e_commerce_app/providers/methodProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../AppRouter/AppRouter.dart';
import '../providers/DBprovider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.raleway(textStyle: TextStyle(color: Colors.black)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        elevation: 0,
      ),
      body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  ElevatedButton(
                      onPressed:
                          Provider.of<MethodProvider>(context, listen: false)
                              .getFile,
                      child: Text("Edit Profile Picture")),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 120.w, child: Text('User Name')),
                      Expanded(
                          child: TextFormField(
                        controller: provider.userNameController,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 120.w, child: Text('Email')),
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: provider.emailNameController,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 120.w, child: Text('Phone Number')),
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: provider.phoneNameController,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 120.w, child: Text('Address')),
                      Expanded(
                          child: TextFormField(
                        controller: provider.addressNameController,
                      ))
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      await provider.updateUser();
                      AppRouter.popWidget();
                    },
                    child: Container(
                        width: 314.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 89, 86, 233),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                  ),
                  Spacer(),
                ],
              )),
            ),
            !provider.loading
                ? Center(child: LoadingSpinner())
                : SizedBox(
                    height: 0,
                    width: 0,
                  ),
          ],
        );
      }),
    );
  }
}
