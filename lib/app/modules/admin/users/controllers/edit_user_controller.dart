import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';

class EditUserController extends GetxController {
  //TODO: Implement AddUserController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Rx<UserProfile?> _user = Rx<UserProfile?>(null);
  UserProfile? get user => _user.value;
  set user(UserProfile? value) => _user.value = value;

  late Worker _worker;
  @override
  void onInit() {
    super.onInit();
    _worker = ever<UserProfile?>(_user, (user) {
      if (user != null) {}
    });
  }

  @override
  void onReady() {
    super.onReady();
    print(Get.arguments());
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  void setUsername(String value) {}
}
