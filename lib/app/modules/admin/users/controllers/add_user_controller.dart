import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/utils/helpers.dart';

class AddUserController extends GetxController {
  //TODO: Implement RegisterController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _userCollection =
      _firebaseFirestore.collection("products");

  final _validationMessages =
      RxMap<String, String?>({"name": "This field is required"});
  Map<String, String?> get validationMessages => _validationMessages;

  final Rx<UserProfileDTO> _userProfileDTO = Rx<UserProfileDTO>(UserProfileDTO(
      company: '', email: '', phoneNumber: '', name: '', password: ''));
  UserProfileDTO get userProfileDTO => _userProfileDTO.value;

  void setUserName(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "name", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfileDTO(userProfileDTO.copyWith(name: value));
    }
  }

  void setEmail(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "email", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfileDTO(userProfileDTO.copyWith(email: value));
    }
  }

  void setPhoneNumber(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "phonenumber", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfileDTO(userProfileDTO.copyWith(phoneNumber: value));
    }
  }

  void setPassword(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "password", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfileDTO(userProfileDTO.copyWith(password: value));
    }
  }

  void setCompany(String value) {
    if (value.isEmpty) {
      validationMessages.assign(
          "company", value.isEmpty ? 'This field is required' : null);
    } else {
      _userProfileDTO(userProfileDTO.copyWith(company: value));
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

  void createUser() async {
    if (formKey.currentState!.validate()) {
      showSnackBar(message: 'Processing Data...please wait');

      await _userCollection.doc().set({
        ...userProfileDTO.toJson(),
        "createdAt": FieldValue.serverTimestamp()
      }).then((_) {
        showSnackBar(message: "User added successfully");
        Get.back();
      }).catchError((onError) {
        showSnackBar(message: "Something went wrong... $onError");
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        showSnackBar(
            message: "Please check your internet connection and try again");
      });
    }
    showSnackBar(message: "Please fill in the required fields");
  } //                             }
}
