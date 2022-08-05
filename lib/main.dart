import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/HomePage.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:e_commerce_app/Screens/SplachScreen.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'SPHelper/SPHelper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SPHelper.initS();
  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DBprovider>(
        create: (context) => DBprovider(), child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            home: Provider.of<DBprovider>(context).checkAppUser(),
          );
        });
  }
}
