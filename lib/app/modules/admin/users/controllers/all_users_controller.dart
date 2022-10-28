import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/edit_user_controller.dart';

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

  showEditUserPage({required UserProfile user}) {
    editUserController.user = user;
  }
}
