import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class UserProfileController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final userProfile = Rx<UserProfile>(
    UserProfile(
      userId: '',
      name: '',
      email: '',
      phoneNumber: '',
      company: '',
    ),
  );

  @override
  void onInit() {
    super.onInit();
    String uid = _firebaseAuth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((event) {
      var user = event.data();
      if (user != null) {
        userProfile(UserProfile.fromJson({...user, "id": event.id}));
      }
    });
  }

  void handleSignOut() async {
    await _firebaseAuth.signOut();
    Get.toNamed(Routes.LOGIN);
  }
}
