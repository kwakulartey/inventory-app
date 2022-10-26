import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            // key: _globalKey,
            child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          children: [
            Center(
                child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: Dimensions.font20 * 2,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(
              height: Dimensions.height45,
            ),
            TextFormField(
                // controller: _emailController,
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
                validator: (value) {}),
            SizedBox(
              height: Dimensions.height15,
            ),
            TextFormField(
                // controller: _passwordController,
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
                          color: Colors.grey, width: Dimensions.width10 / 10)),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: Dimensions.font16),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: Dimensions.width10 / 10),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    controller.forgotPassword;
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 4, 82, 146),
                        fontSize: Dimensions.font16),
                    textAlign: TextAlign.right,
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 4, 82, 146),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () async {
                    controller.login;
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
          ],
        )),
      ),
    );
  }
}
