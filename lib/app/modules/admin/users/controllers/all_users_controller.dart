import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/edit_user_controller.dart';
import 'package:inventory_1/app/modules/admin/users/views/edit_user_view.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class AllUsersController extends GetxController {
  //TODO: Implement AllUsersController
  final EditUserController editUserController = Get.find<EditUserController>();

  RxList<UserProfile> allUsers = RxList<UserProfile>([]);

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      final source = (event.metadata.hasPendingWrites) ? "Local" : "Server";

      allUsers(
        event.docs
            .map((doc) => UserProfile.fromJson({...doc.data(), "id": doc.id}))
            .toList(),
      );
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

  // void showAlertDioal({required UserProfile userProfile}) {
  //   editUserController.user = userProfile;
  //   Get.to(() => EditUserView(user: userProfile));
  // }
  void goToEditUser({required UserProfile userProfile}) {
    editUserController.user = userProfile;
    Get.toNamed(Routes.EDIT_USER, arguments: userProfile);
  }

  void onDeleteUserConfirmed(UserProfile userProfile) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userProfile.userId)
        .delete()
        .then((_) {
      Get.back();
      Get.back();
      Get.snackbar("Success", "Product was deleted successfully");
    });
  }

  void showDialog() {}
}
