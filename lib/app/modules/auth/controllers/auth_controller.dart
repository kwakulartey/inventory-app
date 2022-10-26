import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
//TODO: (Parables login form validation )

// _authManager.isLoading
//                           ? const Center(
//                               child: CircularProgressIndicator.adaptive(),
//                             )
//                           :

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() {
    // if (_globalKey.currentState!.validate()) {
    //   setState(() {
    //     _isLoading = true;
    //   });

    //   bool isSuccessfull = await _authManager.loginUser(
    //       email: _emailController.text.trim(),
    //       password: _passwordController.text);

    //   if (isSuccessfull) {
    //     String uid =
    //         FirebaseAuth.instance.currentUser!.uid;
    //     _clientManager.getClientInfo(uid).then((value) {
    //       if (value!.role == "user") {
    //         Navigator.of(context).pushAndRemoveUntil(
    //             MaterialPageRoute(builder: (context) {
    //           return Dash();
    //         }), (route) => false);

    //         Fluttertoast.showToast(
    //             msg: "Welcome Back",
    //             toastLength: Toast.LENGTH_SHORT,
    //             gravity: ToastGravity.CENTER,
    //             timeInSecForIosWeb: 1,
    //             backgroundColor: Colors.green,
    //             textColor: Colors.white,
    //             fontSize: 16.0);

    //         setState(() {
    //           _isLoading = false;
    //         });
    //       } else if (value.role == "admin") {
    //         setState(() {
    //           _isLoading = false;
    //         });
    //         Navigator.of(context).pushAndRemoveUntil(
    //             MaterialPageRoute(builder: (context) {
    //           return Dashboard();
    //         }), (route) => false);

    //         Fluttertoast.showToast(
    //             msg: "You are not an Admin",
    //             toastLength: Toast.LENGTH_SHORT,
    //             gravity: ToastGravity.CENTER,
    //             timeInSecForIosWeb: 1,
    //             backgroundColor: Colors.green,
    //             textColor: Colors.white,
    //             fontSize: 16.0);
    //       }
    //     });
    //   } else {
    //     Fluttertoast.showToast(
    //         msg: _authManager.message,
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // } else {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Fluttertoast.showToast(
    //       msg: "All fields are required!",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
  }

  void forgotPassword() {
    // Navigator.of(context)
    //                           .push(MaterialPageRoute(builder: (context) {
    //                         return const ForgotPassword();
    //                       }));
  }
}
