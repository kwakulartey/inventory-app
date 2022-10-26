import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              titleTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          primarySwatch: Colors.blue,
        )),
  );
}
