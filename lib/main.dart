import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/authentication/forgot_password.dart';
import 'package:inventory_1/controllers/cart_controller.dart';
import 'package:inventory_1/views/SalesPerson/dash.dart';
import 'package:inventory_1/views/SalesPerson/dashbord_sales.dart';
import 'package:inventory_1/views/dashboard.dart';
import 'package:inventory_1/helpers/dependencies.dart' as dep;

import 'authentication/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dash(),
    );
  }
}
