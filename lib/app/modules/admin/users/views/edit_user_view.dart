import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/modules/admin/users/controllers/edit_user_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class EditUserView extends GetView<EditUserController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE INFO FOR WORKER'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          children: [
            Center(
              child: Text(
                'UPDATE INFO FOR WORKER',
                style: TextStyle(
                    fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    size: Dimensions.iconSize24,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Name'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your full Name',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 5))),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                }),
            SizedBox(
              height: Dimensions.height15,
            ),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    size: Dimensions.iconSize24,
                  ),
                  labelText: ('E-mail'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your E-mail',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 10))),
                ),
                validator: (value) {
                  if (!emailRegExp.hasMatch(value!)) {
                    return 'Enter a valid e-mail!';
                  }

                  if (value.isEmpty) {
                    return 'Please enter an email address';
                  }
                }),
            SizedBox(
              height: Dimensions.height15,
            ),
            // TextFormField(
            //     controller: _passwordController,
            //     obscureText: true,
            //     obscuringCharacter: '*',
            //     keyboardType: TextInputType.visiblePassword,
            //     textCapitalization: TextCapitalization.sentences,
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(
            //         Icons.lock,
            //         size: Dimensions.iconSize24,
            //       ),
            //       floatingLabelBehavior: FloatingLabelBehavior.never,
            //       labelText: ('Password'),
            //       labelStyle: TextStyle(fontSize: Dimensions.font16),
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide(
            //               color: Colors.grey, width: Dimensions.width10 / 10)),
            //       hintText: 'Enter your password',
            //       hintStyle: TextStyle(fontSize: Dimensions.font16),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //               color: Colors.black, width: Dimensions.width10 / 10),
            //           borderRadius: BorderRadius.all(
            //               Radius.circular(Dimensions.radius15 - 10))),
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return 'Enter a valid password';
            //       }

            //       if (value.length < 6) {
            //         return 'Password should not be less than 6 characters';
            //       }
            //     }),
            // SizedBox(
            //   height: Dimensions.height15,
            // ),
            TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.numbers,
                    size: Dimensions.iconSize24,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Mobile Number'),
                  labelStyle: TextStyle(fontSize: Dimensions.font16),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your Mobile Number',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15 - 10))),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your Mobile Number';
                  }
                  return null;
                }),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
              onTap: (() {}),
              child: Container(
                height: Dimensions.height20 * 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 8, 51, 87),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 - 5)),
                child: Center(
                  child: Text(
                    'SAVE CHANGES',
                    style: TextStyle(
                        fontSize: Dimensions.font16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
