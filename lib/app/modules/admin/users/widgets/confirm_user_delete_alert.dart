import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/user_profile/user_profile.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/all_users_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class ConfirmUserDeleteDialog extends GetView<AllUsersController> {
  final UserProfile userProfile;
  const ConfirmUserDeleteDialog({required this.userProfile, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.warning_amber_rounded, color: Colors.red),
      content: Text('Are you sure you want to delete product?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () {
              controller.onDeleteUserConfirmed(userProfile);
            },
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.red, fontSize: Dimensions.font16),
            ))
      ],
    );
    ;
    ;
  }
}
