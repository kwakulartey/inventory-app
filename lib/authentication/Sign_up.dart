import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_1/authentication/login.dart';
import 'package:inventory_1/managers/auth_manager.dart';
import 'package:inventory_1/managers/client_model.dart';
import 'package:inventory_1/models/client_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _companynameController = TextEditingController();
  final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  final ClientManager _clientManager = ClientManager();
  final AuthManager _authManager = AuthManager();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _globalKey,
              child: ListView(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                children: [
                  Center(
                      child: Text(
                    'Sign in to your account',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Name'),
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter your full Name',
                        hintStyle: TextStyle(fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
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
                    height: 15,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
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
                    height: 15,
                  ),
                  TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Mobile Number'),
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter your Mobile Number',
                        hintStyle: TextStyle(fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: _companynameController,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.work),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ('Company name'),
                        labelStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Enter your Company Name',
                        hintStyle: TextStyle(fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
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
                    height: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 13, 70, 117),
                          borderRadius: BorderRadius.circular(10)),
                      child: _authManager.isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : TextButton(
                              onPressed: () async {
                                if (_globalKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  bool isCreated =
                                      await _authManager.ceateNewUser(
                                          client: Client(
                                            email: _emailController.text.trim(),
                                            name: _nameController.text,
                                            phone: _numberController.text,
                                            role: "user",
                                            company:
                                                _companynameController.text,
                                          ),
                                          password:
                                              _passwordController.text.trim());

                                  if (isCreated) {
                                    setState(() {
                                      _isLoading = false;
                                    });

                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }), (route) => false);
                                    Fluttertoast.showToast(
                                        msg: "Please Login Now",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: _authManager.message,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Please fill required fields!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))),
                ],
              ))),
    );
  }
}
