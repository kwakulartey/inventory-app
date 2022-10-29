import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';

class EditUserController extends GetxController {
  //TODO: Implement AddUserController
  late final GlobalKey<FormState> formKey;

  final Rx<UserProfile?> _user = Rx<UserProfile?>(null);
  UserProfile? get user => _user.value;
  set user(UserProfile? value) => _user.value = value;

  late Worker _worker;
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    _worker = ever<UserProfile?>(_user, (user) {
      if (user != null) {}
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("Editusercontroller user: $user");
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  void setUsername(String value) {
    user = user?.copyWith(name: value);
  }

  void setEmail(String value) {
    user = user?.copyWith(email: value);
  }

  void setMobileNumber(String value) {
    user = user?.copyWith(phoneNumber: value);
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'The name cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Email cannot be empty';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Mobile number cannot be empty';
    }
    return null;
  }

  void updateUser() {
    try {
      if (formKey.currentState!.validate()) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user?.userId ?? '')
            .update(user?.toJson() ?? {});

        Get.back();
        Get.snackbar("Success", "Product was updated");
      } else {
        Get.snackbar(
            "Something went wrong", "Please check your inputs and try again");
      }
    } catch (e) {
      Get.snackbar("Error", "something happened: $e");
    }
  }
}
