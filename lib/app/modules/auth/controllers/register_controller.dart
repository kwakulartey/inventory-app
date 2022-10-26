import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _validationMessages =
      RxMap<String, String?>({"name": "This field is required"});
  Map<String, String?> get validationMessages => _validationMessages;

  final Rx<UserProfile> _userProfile = Rx<UserProfile>(
      UserProfile(company: '', email: '', phonenumber: '', name: ''));
  UserProfile get userProfile => _userProfile.value;

  void setUserName(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "name", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfile(userProfile.copyWith(name: value));
    }
  }

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

  void createUser() {
    // if (_globalKey.currentState!.validate()) {
    //                               setState(() {
    //                                 _isLoading = true;
    //                               });

    //                               bool isCreated =
    //                                   await _authManager.ceateNewUser(
    //                                       client: Client(
    //                                         email: _emailController.text.trim(),
    //                                         name: _nameController.text,
    //                                         phone: _numberController.text,
    //                                         role: "user",
    //                                         company:
    //                                             _companynameController.text,
    //                                       ),
    //                                       password:
    //                                           _passwordController.text.trim());

    //                               if (isCreated) {
    //                                 setState(() {
    //                                   _isLoading = false;
    //                                 });

    //                                 Navigator.of(context).pushAndRemoveUntil(
    //                                     MaterialPageRoute(builder: (context) {
    //                                   return Login();
    //                                 }), (route) => false);
    //                                 Fluttertoast.showToast(
    //                                     msg: "Please Login Now",
    //                                     toastLength: Toast.LENGTH_SHORT,
    //                                     gravity: ToastGravity.CENTER,
    //                                     timeInSecForIosWeb: 1,
    //                                     backgroundColor: Colors.green,
    //                                     textColor: Colors.white,
    //                                     fontSize: 16.0);
    //                               } else {
    //                                 Fluttertoast.showToast(
    //                                     msg: _authManager.message,
    //                                     toastLength: Toast.LENGTH_SHORT,
    //                                     gravity: ToastGravity.CENTER,
    //                                     timeInSecForIosWeb: 1,
    //                                     backgroundColor: Colors.red,
    //                                     textColor: Colors.white,
    //                                     fontSize: 16.0);
    //                               }
    //                             } else {
    //                               Fluttertoast.showToast(
    //                                   msg: "Please fill required fields!",
    //                                   toastLength: Toast.LENGTH_SHORT,
    //                                   gravity: ToastGravity.CENTER,
    //                                   timeInSecForIosWeb: 1,
    //                                   backgroundColor: Colors.red,
    //                                   textColor: Colors.white,
    //                                   fontSize: 16.0);
    //                             }
  }
}
