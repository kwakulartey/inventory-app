import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';

class UserAccountsController extends GetxController {
  //TODO: Implement UserAccountsController

  final userProfile = Rx<UserProfile>(
    UserProfile(name: '', email: '', phonenumber: '', company: ''),
  );

  @override
  void onInit() {
    super.onInit();
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((event) {
      var user = event.data();
      if (user != null) {
        userProfile(UserProfile.fromJson(user));
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
