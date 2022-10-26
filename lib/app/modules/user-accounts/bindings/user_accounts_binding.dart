import 'package:get/get.dart';

import 'package:inventory_1/app/modules/user-accounts/controllers/all_users_controller.dart';

import '../controllers/user_accounts_controller.dart';

class UserAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(
      () => AllUsersController(),
    );
    Get.lazyPut<UserAccountsController>(
      () => UserAccountsController(),
    );
  }
}
