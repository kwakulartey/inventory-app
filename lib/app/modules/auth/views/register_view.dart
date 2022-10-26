import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/modules/auth/controllers/register_controller.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                children: [
                  Center(
                      child: Text(
                    'Create User',
                    style: TextStyle(
                      fontSize: Dimensions.font20 + 5,
                    ),
                  )),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  TextFormField(
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
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Enter your full Name',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
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
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Enter your E-mail',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius15 - 10))),
                      ),
                      validator: (value) {}),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: Dimensions.iconSize24,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Password'),
                        labelStyle: TextStyle(fontSize: Dimensions.font16),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius15 - 10))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password';
                        }

                        if (value.length < 6) {
                          return 'Password should not be less than 6 characters';
                        }
                      }),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextFormField(
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
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Enter your Mobile Number',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
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
                    height: Dimensions.height15,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.work,
                          size: Dimensions.iconSize24,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Company name'),
                        labelStyle: TextStyle(fontSize: Dimensions.font16),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: Dimensions.width10 / 10)),
                        hintText: 'Enter your Company Name',
                        hintStyle: TextStyle(fontSize: Dimensions.font16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: Dimensions.width10 / 10),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Company Name';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 13, 70, 117),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15 - 5)),
                      child: TextButton(
                          onPressed: () async {
                            controller.createUser;
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ))),
                ],
              ))),
    );
  }
}
