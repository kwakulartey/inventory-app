import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_1/authentication/Sign_up.dart';
import 'package:inventory_1/authentication/forgot_password.dart';
import '../views/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            child: ListView(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          children: [
            Center(
                child: Text(
              'Welcome',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 40,
            ),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: ('E-mail'),
                  labelStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Enter your E-mail',
                  hintStyle: TextStyle(fontSize: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
              height: 10,
            ),
            TextFormField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: ('Password'),
                  labelStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
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
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ForgotPassword();
                    }));
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 82, 146), fontSize: 16),
                    textAlign: TextAlign.right,
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () async {
                      
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context) {
                      //   return Dashboard();
                      // }), (route) => false);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ))),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Dont have an account?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return const SignUp();
                      }), (route) => false);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 82, 146),
                        fontSize: 16,
                      ),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
