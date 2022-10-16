import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_1/models/client_model.dart';
import 'package:inventory_1/services/file_uploads_services.dart';

class AuthManager with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  final FileUploadService _fileUploadService = FileUploadService();

  CollectionReference userCollection = _firebaseFirestore.collection('users');
  final CollectionReference<Map<String, dynamic>> _userCollection =
      _firebaseFirestore.collection("users");

  String _message = '';
  bool _isloading = false;

  String get message => _message;
  bool get isLoading => _isloading;

  setMesage(String message) {
    _message = message;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isloading = isLoading;
    notifyListeners();
  }

  Future<bool> ceateNewUser(
      {required Client client, required String password}) async {
    setIsLoading(true);
    bool isCreated = false;
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: client.email, password: password)
        .then((userCredential) async {
      // String? profileImage = await _fileUploadService.uploadFile(file: client.profilePicture, uid: uid)
      userCollection.doc(userCredential.user!.uid).set({
        "name": client.name,
        "email": client.email,
        "phonenumber": client.phone,
        "role": client.role,
        "user_id": userCredential.user!.uid,
        "company": client.company
      });
      isCreated = true;
    }).catchError((onError) {
      setMesage('Failed: $onError');
      isCreated = false;
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      setMesage("Please check your internet connection");
      isCreated = false;
      setIsLoading(false);
    });
    return isCreated;
  }

  Future<bool> createSalesAgent(
      {required Client client, required String password}) async {
    setIsLoading(true);
    bool isCreated = false;
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: client.email, password: password)
        .then((userCredential) async {
      // String? profileImage = await _fileUploadService.uploadFile(file: client.profilePicture, uid: uid)
      userCollection.doc(userCredential.user!.uid).set({
        "name": client.name,
        "email": client.email,
        "phonenumber": client.phone,
        "role": "user",
        "user_id": userCredential.user!.uid
      });
      isCreated = true;
    }).catchError((onError) {
      setMesage('Failed: $onError');
      isCreated = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      setMesage("Please check your internet connection");
      isCreated = false;
      setIsLoading(false);
    });
    setIsLoading(false);
    return isCreated;
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    bool isSuccessful = false;
    setIsLoading(true);
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      if (userCredential.user != null) {
        isSuccessful = true;
      } else {
        isSuccessful = false;
        setIsLoading(false);
        _isloading = false;
      }
    }).catchError((onError) {
      setMesage('$onError');
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      setMesage('Please check your connection');
      isSuccessful = false;
      setIsLoading(false);
    });
    return isSuccessful;
  }

  //READ USERS
  Stream<QuerySnapshot<Map<String, dynamic>?>>? getUsers() {
    return _userCollection.snapshots();
  }

  //DELETE USER
  Future<bool> deletedUser({required String userId}) async {
    bool isDeleted = false;
    await _userCollection.doc(userId).delete().then((value) {
      isDeleted = true;
      setMesage("Employee deleted succefully");
    }).catchError((onError) {
      setMesage("Failed to delete person: $onError");
      setIsLoading(false);
      isDeleted = false;
    });
    return isDeleted;
  }

  //READ A USER
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(
      {required String userId}) {
    return _userCollection.doc(userId).snapshots();
  }
}
