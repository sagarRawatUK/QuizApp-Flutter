import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/commons/style/theme.dart';
import 'app/routes/app_pages.dart';

String initialRoute = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await GetStorage.init();
  bool isLoggedIn = GetStorage().read('isLoggedIn') ?? false;
  if (isLoggedIn)
    initialRoute = Routes.QUIZ;
  else
    initialRoute = AppPages.INITIAL;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: appTheme,
    );
  }
}
