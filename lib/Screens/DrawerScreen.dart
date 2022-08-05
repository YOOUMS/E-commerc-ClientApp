import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/DBprovider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 89, 86, 233),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: (BoxDecoration(color: Colors.white.withOpacity(0))),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.perm_identity),
              ),
              accountEmail: Text(Provider.of<DBprovider>(context).user!.email!),
              accountName: Text(""),
            ),
            ListTile(
              leading: Icon(
                Icons.perm_identity_rounded,
                size: 24,
                color: Colors.white,
              ),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Profile",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 74.w),
              child: Divider(
                endIndent: 132.w,
                color: Colors.white,
                thickness: 0.3.h,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag_outlined,
                size: 24,
                color: Colors.white,
              ),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My orders",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 74.w),
              child: Divider(
                endIndent: 132.w,
                color: Colors.white,
                thickness: 0.3.h,
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline_rounded,
                  size: 24, color: Colors.white),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Favorites",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 74.w),
              child: Divider(
                endIndent: 132.w,
                color: Colors.white,
                thickness: 0.3.h,
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.settings_outlined, size: 24, color: Colors.white),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Settings",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 74.w),
              child: Divider(
                endIndent: 132.w,
                color: Colors.white,
                thickness: 0.3.h,
              ),
            ),
            SizedBox(
              height: 200.h,
            ),
            ListTile(
              onTap: () =>
                  Provider.of<DBprovider>(context, listen: false).signOut(),
              leading: Icon(Icons.exit_to_app_outlined,
                  size: 24, color: Colors.white),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sign out",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ));
  }
}
