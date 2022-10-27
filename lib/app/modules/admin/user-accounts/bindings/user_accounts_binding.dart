import 'package:get/get.dart';

import '../controllers/user_accounts_controller.dart';

class UserAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAccountsController>(
      () => UserAccountsController(),
    );
  }
}
