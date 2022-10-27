// // app/data/providers/firebase_auth_provider.dart
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:crypto/crypto.dart';
// // import 'package:digimart/app/data/models/app_models.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// // import 'package:github_sign_in/github_sign_in.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// // import 'package:twitter_login/entity/auth_result.dart';
// // import 'package:twitter_login/twitter_login.dart';

// class FirebaseAuthProvider extends GetxController {
// //   FirebaseAuthProvider({
//   // required this.socialOauthConfig,
// //   });
// //   SocialOauthConfig socialOauthConfig;

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   FirebaseAuth get firebaseAuth => _firebaseAuth;

//   Rx<User?> get _currentUser => _firebaseAuth.currentUser.obs;
//   User? get currentUser => _currentUser.value;

//   final _userIsAdmin = false.obs;
//   bool get userIsAdmin => _userIsAdmin.value;
//   Rx<bool> get rxUserIsAdmin => _userIsAdmin;
//   set userIsAdmin(bool value) => _userIsAdmin.value = value;

//   User? anonymousUser() {
//     User? _initialUser = _firebaseAuth.currentUser;
//     if (_initialUser != null && _initialUser.isAnonymous) return _initialUser;
//     return null;
//   }

//   // late final StreamSubscription<User?> userChangesStream;

//   @override
//   void onInit() {
//     super.onInit();
//     // listen to user changes
//     _firebaseAuth.userChanges().listen((User? user) async {
//       _currentUser(user);
//       if (_currentUser() == null) {
//         _userIsAdmin(false);
//         return;
//       }
//       FirebaseFirestore.instance
//           .doc("users/profiles/admin/${_currentUser()!.uid}")
//           .get()
//           .then((DocumentSnapshot userProfile) {
//         _userIsAdmin(userProfile.exists);
//         print("Auth changed in Cloud firestore.... userIsAdmin${userIsAdmin}}");
//       });
//     });
//   }

//   @override
//   void onClose() {
//     // userChangesStream.cancel();
//     super.onClose();
//   }

// // AUTH METHODS
//   Future<UserCredential?> linkAnonUserCredential(
//       {UserCredential? userCredential}) async {
//     try {
//       User? _anonymousUser = anonymousUser();
//       AuthCredential? authCredential = userCredential?.credential;

//       if (_anonymousUser != null && authCredential != null) {
//         return await linkWithCredential(
//           user: _anonymousUser,
//           authCredential: authCredential,
//         );
//       }

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

// //1. Anonymous
//   Future<UserCredential?> signInAnonymously() async {
//     UserCredential userCredential = await _firebaseAuth.signInAnonymously();
//     return userCredential;
//   }

// // 2. Email and Password
//   Future<UserCredential?> signUpWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential =
//           await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return linkAnonUserCredential(userCredential: userCredential);
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   Future<UserCredential?> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return linkAnonUserCredential(userCredential: userCredential);
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   ///Sends a verification email to a user.

//   ///The verification process is completed by calling [applyActionCode].
//   ///READ MORE: https://firebase.google.com/docs/auth/web/passing-state-in-email-actions#handling_email_actions_in_a_mobile_application
//   Future<void> verifyEmail({ActionCodeSettings? actionCodeSettings}) async {
//     User? user = _firebaseAuth.currentUser;
//     if (user != null && !user.emailVerified) {
//       /*Sample of ActionCodeSettings
//         var actionCodeSettings = ActionCodeSettings(
//           url: 'https://www.example.com/?email=${user.email}',
//           dynamicLinkDomain: 'example.page.link',
//           androidPackageName: 'com.example.android',
//           androidInstallApp: true,
//           androidMinimumVersion: '12',
//           iOSBundleId: 'com.example.ios',
//           handleCodeInApp: true,
//         );
//       */

//       await user.sendEmailVerification(actionCodeSettings);
//     }
//   }

// // 4.Email Link
//   void sendSignInLinkToEmail({
//     required String email,
//     required ActionCodeSettings actionCodeSettings,
//   }) {
//     /* Sample of ActionCodeSettings
//   ActionCodeSettings _actionCodeSettings = ActionCodeSettings(
//     // URL you want to redirect back to. The domain (www.example.com) for this
//     // URL must be whitelisted in the Firebase Console.
//     url: 'https://www.example.com/finishSignUp?cartId=1234',
//     // This must be true
//     handleCodeInApp: true,Sends a verification email to a user.

// The verification process is completed by calling [applyActionCode].
//     iOSBundleId: 'com.example.ios',
//     androidPackageName: 'com.example.android',
//     // installIfNotAvailable
//     androidInstallApp: true,
//     // minimumVersion
//     androidMinimumVersion: '12');
//   */

//     _firebaseAuth
//         .sendSignInLinkToEmail(
//             email: email, actionCodeSettings: actionCodeSettings)
//         .catchError(
//             (onError) => print('Error sending email verification $onError'))
//         .then((value) => print('Successfully sent email verification'));
//   }

//   verifySignInLink({
//     required String email,
//     required String emailLink,
//   }) {
// // Retrieve the email from wherever you stored it
// // Confirm the link is a sign-in with email link.
//     if (_firebaseAuth.isSignInWithEmailLink(emailLink)) {
//       // The client SDK will parse the code from the link for you.
//       _firebaseAuth
//           .signInWithEmailLink(email: email, emailLink: emailLink)
//           .then((userCredential) {
//         print('Successfully signed in with email link!');
//         return linkAnonUserCredential(userCredential: userCredential);
//       }).catchError((onError) {
//         print('Error signing in with email link $onError');
//       });
//     }
//   }

// // 2. Phone
// // phone auth for the mobile, STEP 1

//   Future<UserCredential?> verifyPhoneNumber({
//     required String phoneNumber,
//     Function(PhoneAuthCredential)? verificationCompleted,
//     Function(FirebaseAuthException)? verificationFailed,
//     Function(String, int?)? codeSent,
//     Function(String)? codeAutoRetrievalTimeout,
//     String? autoRetrievedSmsCodeForTesting,
//     Duration timeout = const Duration(seconds: 60),
//     int? forceResendingToken,
//   }) async {
//     UserCredential? userCredential;
//     await _firebaseAuth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         if (verificationCompleted != null)
//           return verificationCompleted(credential);
//         // Sign the user in (or link) with the auto-generated credential
//         else if (GetPlatform.isAndroid)
//           userCredential = await signInWithCredential(credential: credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (verificationFailed != null) {
//           return verificationFailed(e);
//         }
//         // else
//         handleFirebaseAuthException(e);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         if (codeSent != null) {
//           return codeSent(verificationId, resendToken);
//         }
//         // else TODO: Fix this with #go_router
//         // Get.rootDelegate.toNamed(
//         //   Routes.SIGN_UP_PHONE_OTP_NEXT(
//         //     verificationId: verificationId,
//         //     resendToken: resendToken,
//         //     next: Routes.HOME,
//         //   ),
//         // );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // TODO: Handle resend
//         if (codeAutoRetrievalTimeout != null) {
//           return codeAutoRetrievalTimeout(verificationId);
//         }
//         // else
//         print("codeAutoRetrievalTimeout... handle resend");
//       },
//       forceResendingToken: forceResendingToken,
//       timeout: timeout,
//     );
//     return linkAnonUserCredential(userCredential: userCredential);
//   }

// // phone auth for the mobile, STEP 2
//   Future<PhoneAuthCredential?> submitOtp({
//     required String verificationId,
//     required String smsCode,
//   }) async {
//     // Create a PhoneAuthCredential with the code
//     PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );

//     // Sign the user in (or link) with the credential
//     if (!GetPlatform.isAndroid) {
//       UserCredential? userCredential =
//           await signInWithCredential(credential: phoneAuthCredential);

//       linkAnonUserCredential(userCredential: userCredential);
//     }
//     return phoneAuthCredential;
//   }

// // phone auth for the web, STEP 1
//   Future<ConfirmationResult?> signInWithPhoneNumber({
//     required String phoneNumber,
//     RecaptchaVerifier? recaptchaVerifier,
//   }) async {
//     if (GetPlatform.isWeb) {
//       // Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
//       ConfirmationResult confirmationResult = await _firebaseAuth
//           .signInWithPhoneNumber(phoneNumber, recaptchaVerifier);
//       return confirmationResult;
//     }
//   }

// // phone auth for the web, STEP 2
//   Future<UserCredential?> confirmResult({
//     required ConfirmationResult confirmationResult,
//     required String smsCode,
//   }) async {
//     if (GetPlatform.isWeb) {
//       UserCredential userCredential = await confirmationResult.confirm(smsCode);
//       return linkAnonUserCredential(userCredential: userCredential);
//     }
//   }

// // 5. Social Auth Credentials
//   Future<UserCredential?> signInWithGoogle({
//     String? email,
//   }) async {
//     if (GetPlatform.isWeb) {
//       // Create a new provider
//       GoogleAuthProvider googleProvider = GoogleAuthProvider();

//       googleProvider
//           .addScope('https://www.googleapis.com/auth/contacts.readonly');
//       googleProvider.setCustomParameters({'login_hint': email});

//       // Once signed in, return the UserCredential
//       return await FirebaseAuth.instance.signInWithPopup(googleProvider);

//       // Or use signInWithRedirect
//       // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
//     } else {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       return await signInWithCredential(credential: credential);
//     }
//   }

//   Future<UserCredential?> signInWithFacebook() async {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();

//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);

//     // Once signed in, return the UserCredential
//     return await signInWithCredential(credential: facebookAuthCredential);
//   }

//   //flutter_twitter_login: ^1.1.0
//   Future<UserCredential?> signInWithTwitter() async {
//     if (socialOauthConfig.twitterConfig != null) {
//       // Create a TwitterLogin instance
//       final TwitterLogin twitterLogin = new TwitterLogin(
//         redirectURI: '',
//         apiKey: socialOauthConfig.twitterConfig!.apiKey,
//         apiSecretKey: socialOauthConfig.twitterConfig!.apiSecret,
//       );

//       // Trigger the sign-in flow
//       final AuthResult authResult = await twitterLogin.login();

//       switch (authResult.status) {
//         case TwitterLoginStatus.loggedIn:
//           // success
//           // Get the Logged In session
//           // final TwitterSession twitterSession = authResult.session;

//           // Create a credential from the access token
//           final AuthCredential twitterAuthCredential =
//               TwitterAuthProvider.credential(
//             accessToken: authResult.authToken!,
//             secret: authResult.authTokenSecret!,
//           );

//           // Once signed in, return the UserCredential
//           return await signInWithCredential(credential: twitterAuthCredential);

//         case TwitterLoginStatus.cancelledByUser:
//           // cancel
//           break;
//         case TwitterLoginStatus.error:
//           // error
//           break;
//         default:
//       }
//     }
//     throw Exception("twitterConfig not set in FirebaseAuthProvider instance");
//   }

// /*   //  github_sign_in: ^0.0.1
//   Future<UserCredential?> signInWithGitHub() async {
//     if (socialOauthConfig.githubConfig != null) {
//       // Create a GitHubSignIn instance
//       final GitHubSignIn gitHubSignIn = GitHubSignIn(
//           clientId: socialOauthConfig.githubConfig!.clientId,
//           clientSecret: socialOauthConfig.githubConfig!.clientSecret,
//           redirectUrl: socialOauthConfig.githubConfig!.redirectUrl);

//       // Trigger the sign-in flow
//       final result = await gitHubSignIn.signIn(Get.context);

//       // Create a credential from the access token
//       final AuthCredential githubAuthCredential =
//           GithubAuthProvider.credential(result.token);

//       // Once signed in, return the UserCredential
//       return await signInWithCredential(credential: githubAuthCredential);
//     }
//     throw Exception("githubConfig not set in FirebaseAuthProvider instance");
//   }
//  */
//   Future<UserCredential?> signInWithApple() async {
//     if (GetPlatform.isWeb) {
//       // Create and configure an OAuthProvider for Sign In with Apple.
//       final provider = OAuthProvider("apple.com")
//         ..addScope('email')
//         ..addScope('name');

//       // Sign in the user with Firebase.
//       return await FirebaseAuth.instance.signInWithPopup(provider);
//     } else if (GetPlatform.isIOS || GetPlatform.isMacOS) {
//       // To prevent replay attacks with the credential returned from Apple, we
//       // include a nonce in the credential request. When signing in with
//       // Firebase, the nonce in the id token returned by Apple, is expected to
//       // match the sha256 hash of `rawNonce`.
//       final rawNonce = generateNonce();
//       final nonce = sha256ofString(rawNonce);

//       // Request credential for the currently signed in Apple account.
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );

//       // Create an `OAuthCredential` from the credential returned by Apple.
//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         rawNonce: rawNonce,
//       );

//       // Sign in the user with Firebase. If the nonce we generated earlier does
//       // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//       return await signInWithCredential(credential: oauthCredential);
//     }
//   }

//   /// Generates a cryptographically secure random nonce, to be included in a
//   /// credential request.
//   String generateNonce([int length = 32]) {
//     final charset =
//         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//         .join();
//   }

//   /// Returns the sha256 hash of [input] in hex notation.
//   String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

// // 6. Helper Methods
//   Future<UserCredential?> signInWithCredential({
//     required AuthCredential credential,
//   }) async {
//     try {
//       return linkAnonUserCredential(
//         userCredential: await _firebaseAuth.signInWithCredential(credential),
//       );
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   Future<UserCredential?> reauthenticateWithCredential(
//       {required String email,
//       required String password,
//       Function(UserCredential userCredential)?}) async {
//     try {
// // Create a credential
//       AuthCredential credential = EmailAuthProvider.credential(
//         email: email,
//         password: password,
//       );

// // Reauthenticate
//       UserCredential userCredential = await _firebaseAuth.currentUser!
//           .reauthenticateWithCredential(credential);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   Future<UserCredential> linkWithCredential({
//     required User user,
//     required AuthCredential authCredential,
//   }) async {
//     return await user.linkWithCredential(authCredential);
//   }

// /** Links the user account with the given phone number.

// This method is only supported on web platforms.
//  */
//   Future linkWithPhoneNumber({
//     required User user,
//     required String phoneNumber,
//     RecaptchaVerifier? verifier,
//   }) async {
//     try {
//       await user.linkWithPhoneNumber(phoneNumber, verifier);
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   Future<void> showLinkAccountsDialog({
//     required String email,
//     required AuthCredential pendingCredential,
//   }) async {
//     // Fetch a list of what sign-in methods exist for the conflicting user
//     List<String> userSignInMethods =
//         await _firebaseAuth.fetchSignInMethodsForEmail(email);

//     Get.defaultDialog(
//         title: "Link accounts?",
//         middleText: """
//       An account already exists for this $email with ${userSignInMethods.first}.
//       \n\nYou can link ${pendingCredential.providerId} with your existing account 
//       and use both accounts on the app
//       """,
//         content: ListTile(
//           title: Text(userSignInMethods.first),
//           subtitle: Text("Login required"),
//           trailing: Icon(Icons.keyboard_arrow_right),
//         ),
//         textConfirm: "Link accounts",
//         textCancel: "Cancel",
//         onConfirm: () async {
//           linkWithOtherAccount(
//             firstUserSignInMethod: userSignInMethods.first,
//             email: email,
//             pendingCredential: pendingCredential,
//           );
//         });
//   }

//   Future<void> linkWithOtherAccount({
//     required String firstUserSignInMethod,
//     required String email,
//     required AuthCredential pendingCredential,
//   }) async {
//     // Sign the user in to their account with the password
//     try {
//       UserCredential? userCredential;
//       if (firstUserSignInMethod == 'password') {
//         // getLocalCredentials().then((c) async {
//         //   userCredential = await signInWithEmailAndPassword(
//         //     email: email,
//         //     password: c.password,
//         //   );
//         // });
//       } else if (firstUserSignInMethod == 'facebook.com') {
//         userCredential = await signInWithFacebook();
//       } else if (firstUserSignInMethod == 'twitter.com') {
//         userCredential = await signInWithTwitter();
//       } /* else if (firstUserSignInMethod == 'github.com') {
//         userCredential = await signInWithGitHub();
//       }  */
//       else if (firstUserSignInMethod == 'google.com') {
//         userCredential = await signInWithGoogle();
//       } else if (firstUserSignInMethod == 'apple.com') {
//         userCredential = await signInWithApple();
//       }

//       User? user = userCredential?.user;

//       // Link the pending credential with the existing account
//       if (user != null)
//         await linkWithCredential(
//           user: user,
//           authCredential: pendingCredential,
//         );
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e);
//     }
//   }

//   Future<void> deleteUser() async {
//     try {
//       await FirebaseAuth.instance.currentUser!.delete();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'requires-recent-login') {
//         print(
//             'The user must reauthenticate before this operation can be executed.');
//       }
//     }
//   }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }

//   void handleFirebaseAuthException(FirebaseAuthException e) {
//     if (e.code == 'user-mismatch') {
// // Thrown if the credential given does not correspond to the user.
//     } else if (e.code == 'user-not-found') {
// // Thrown if the credential given does not correspond to any existing user.
// // Thrown if signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email.

//     } else if (e.code == 'invalid-credential') {
// // Thrown if the provider's credential is not valid.
// //This can happen if it has already expired when calling link, or if it used invalid token(s). 44
// //See the Firebase documentation for your provider, and make sure you pass in the correct parameters to the credential method.

//     } else if (e.code == 'invalid-email') {
// // Thrown if the email used in a [EmailAuthProvider.credential] is invalid.

//     } else if (e.code == 'wrong-password') {
// // Thrown if the password used in a [EmailAuthProvider.credential] is not correct or when the user associated with the email does not have a password.
// // Thrown if signing in with a credential from [EmailAuthProvider.credential] and the password is invalid for the given email, or if the account corresponding to the email does not have a password set.

//     } else if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     } else if (e.code == 'invalid-verification-code') {
// // Thrown if the credential is a [PhoneAuthProvider.credential] and the verification code of the credential is not valid.
//     } else if (e.code == 'invalid-verification-id') {
// // Thrown if the credential is a [PhoneAuthProvider.credential] and the verification ID of the credential is not valid.
//     } else if (e.code == 'account-exists-with-different-credential') {
//       // Thrown if there already exists an account
//       //with the email address asserted by the credential.
//       //Resolve this by calling [fetchSignInMethodsForEmail]
//       //and then asking the user to sign in using one of the returned providers.
//       //Once the user is signed in, the original credential
//       //can be linked to the user with [linkWithCredential].
//       handleAccountExistsWithDifferentCredentialError(e);
//     } else if (e.code == 'operation-not-allowed') {
// // Thrown if the type of account corresponding to the credential is not enabled. Enable the account type in the Firebase Console, under the Auth tab.

//     } else if (e.code == 'user-disabled') {
// //Thrown if the user corresponding to the given credential has been disabled.

//     } else if (e.code == 'provider-already-linked') {
// // Thrown if the provider has already been linked to the user.
// //This error is thrown even if this is not the same provider's account that is currently linked to the user.

//     } else if (e.code == 'captcha-check-failed') {
// // Thrown if the reCAPTCHA response token was invalid, expired, or if this method was called from a non-whitelisted domain.

//     } else if (e.code == 'invalid-phone-number') {
// // Thrown if the phone number has an invalid format.

//     } else if (e.code == 'quota-exceeded') {
// // Thrown if the SMS quota for the Firebase project has been exceeded.

//     } else if (e.code == 'credential-already-in-use') {
// // Thrown if the account corresponding to the phone number already exists among your users, or is already linked to a Firebase User.

//     } else if (e.code == 'operation-not-allowed') {
// // Thrown if you have not enabled the phone authentication provider in the Firebase Console.
// //Go to the Firebase Console for your project, in the Auth section and the Sign in Method tab and configure the provider.

//     }
//   }

//   Future<void> handleAccountExistsWithDifferentCredentialError(e) async {
//     if (e.code == 'account-exists-with-different-credential') {
//       try {
//         // The account already exists with a different credential
//         String email = e.email;
//         AuthCredential pendingCredential = e.credential;

//         showLinkAccountsDialog(
//           email: email,
//           pendingCredential: pendingCredential,
//         );
//       } on FirebaseAuthException catch (e) {
//         handleFirebaseAuthException(e);
//       }
//     }
//   }
// }
