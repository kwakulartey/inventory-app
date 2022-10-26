import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/user-accounts/controllers/add_user_controller.dart';

class AllUsersView extends GetView<AddUserController> {
  const AllUsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllUsersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
