import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_1/managers/auth_manager.dart';
import 'package:inventory_1/managers/client_model.dart';
import 'package:inventory_1/models/client_model.dart';
import 'package:inventory_1/utils/dimmension.dart';
import 'package:inventory_1/views/edit_colla.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Colla extends StatefulWidget {
  const Colla({Key? key}) : super(key: key);

  @override
  State<Colla> createState() => _CollaState();
}

class _CollaState extends State<Colla> {
  final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final ClientManager _clientManager = ClientManager();
  final AuthManager _authManager = AuthManager();
  final GlobalKey<FormState> _globalKey = GlobalKey();
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
          stream: _authManager.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data == null) {
              const Center(
                child: Text('No User'),
              );
            }

            return ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height20),
                itemBuilder: ((context, index) {
                  var userId = snapshot.data!.docs[index].id;

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
                            '${snapshot.data!.docs[index].data()!['name']}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${snapshot.data!.docs[index].data()!['phonenumber']}',
                            style: TextStyle(fontSize: Dimensions.font16),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: (() =>
                                      showMaterialModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return editcolla(userId: userId,
                                               );
                                          })),
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
                                                  onPressed: () async {
                                                    bool isDeleted =
                                                        await _authManager
                                                            .deletedUser(
                                                                userId: userId);
                                                    if (isDeleted) {
                                                      Navigator.pop(context);
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Product Deleted",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Colors.green,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg: '',
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Colors.red,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                    }
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize:
                                                            Dimensions.font16),
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
                itemCount:
                    snapshot.data == null ? 0 : snapshot.data!.docs.length);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 51, 87),
        onPressed: (() => showMaterialModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                    horizontal: Dimensions.width10),
                child: SafeArea(
                  child: Form(
                    key: _globalKey,
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            'ADD WORKERS',
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w600),
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: ('Name'),
                              labelStyle:
                                  TextStyle(fontSize: Dimensions.font16),
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
                                      Radius.circular(
                                          Dimensions.radius15 - 5))),
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
                              labelStyle:
                                  TextStyle(fontSize: Dimensions.font16),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: Dimensions.width10 / 10)),
                              hintText: 'Enter your E-mail',
                              hintStyle: TextStyle(fontSize: Dimensions.font16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      width: Dimensions.width10 / 10),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          Dimensions.radius15 - 10))),
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
                        TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.visiblePassword,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: Dimensions.iconSize24,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: ('Password'),
                              labelStyle:
                                  TextStyle(fontSize: Dimensions.font16),
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
                                      Radius.circular(
                                          Dimensions.radius15 - 10))),
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
                            controller: _numberController,
                            keyboardType: TextInputType.visiblePassword,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.numbers,
                                size: Dimensions.iconSize24,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: ('Mobile Number'),
                              labelStyle:
                                  TextStyle(fontSize: Dimensions.font16),
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
                                      Radius.circular(
                                          Dimensions.radius15 - 10))),
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
                          onTap: (() async {
                            if (_globalKey.currentState!.validate()) {
                              bool isCreated =
                                  await _authManager.createSalesAgent(
                                      client: Client(
                                          email: _emailController.text.trim(),
                                          name: _nameController.text,
                                          phone: _numberController.text),
                                      password:
                                          _passwordController.text.trim());

                              if (isCreated) {
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(
                                    msg:
                                        "${_nameController.text} has been added a sales person",
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
                                  msg: "Please fill required fields before!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }),
                          child: Container(
                            height: Dimensions.height20 * 2.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 8, 51, 87),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius15 - 5)),
                            child: Center(
                              child: Text(
                                'Add Worker',
                                style: TextStyle(
                                    fontSize: Dimensions.font20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
        child: Icon(
          Icons.add,
          size: Dimensions.iconSize24,
        ),
      ),
    );
  }
}
