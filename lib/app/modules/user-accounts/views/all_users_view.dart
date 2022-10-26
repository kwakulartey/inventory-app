import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/all_users_controller.dart';

class AllUsersView extends GetView<AllUsersController> {
  const AllUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Collatorators',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height20),
          itemBuilder: ((context, index) {
            return Container(
              height: Dimensions.height20 * 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: Dimensions.width10 / 10,
                          color: Colors.black26))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'name',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'phone number',
                      style: TextStyle(fontSize: Dimensions.font16),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: (() {}),
                            // (() =>
                            //     showMaterialModalBottomSheet(
                            //         context: context,
                            //         builder: (context) {
                            //           return editcolla(
                            //             userId: userId,
                            //           );
                            //         })),
                            icon: Icon(
                              Icons.edit,
                              size: Dimensions.iconSize24,
                              color: Color.fromARGB(255, 4, 57, 100),
                            )),
                        IconButton(
                            onPressed: (() {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: const Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red),
                                      content: Text(
                                          'Are you sure you want to delete product?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No')),
                                        TextButton(
                                            onPressed: () async {},
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: Dimensions.font16),
                                            ))
                                      ],
                                    );
                                  }));
                            }),
                            icon: Icon(
                              Icons.delete_rounded,
                              size: Dimensions.iconSize24,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return SizedBox(height: Dimensions.height10);
          }),
          itemCount: 0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 51, 87),
        onPressed: controller.showCreateUserModal,
        child: Icon(
          Icons.add,
          size: Dimensions.iconSize24,
        ),
      ),
    );
  }
}
