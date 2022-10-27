import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:repromedics_healthcare_app/app/data/providers/nhost_auth_provider.dart';
import 'package:repromedics_healthcare_app/app/routes/app_router.dart';
import 'package:repromedics_healthcare_app/app/widgets/buttons.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AuthController extends GetxController {
  final NhostAuthProvider _nhostAuthProvider = Get.find<NhostAuthProvider>();
  final SubmitButtonController _submitButtonController =
      Get.find<SubmitButtonController>();

  final _username = ''.obs;
  String get username => _username.value;
  set username(String value) => _username.value = value;

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

  final _obscureText = false.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  late Worker _worker;
  late GlobalKey<FormState> signUpFormKey;
  late GlobalKey<FormState> signInFormKey;
  late TextEditingController usernameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  @override
  void onInit() {
    super.onInit();

    signUpFormKey = GlobalKey<FormState>();
    signInFormKey = GlobalKey<FormState>();
    usernameTextEditingController = TextEditingController(text: username);
    emailTextEditingController = TextEditingController(text: email);
    passwordTextEditingController = TextEditingController(text: password);

    _worker = everAll([_username, _email, _password], (_) {
      if (QR.isCurrentName(AppRouter.signIn)) {
        _submitButtonController.isFormValid =
            signInFormKey.currentState!.validate();
      } else if (QR.isCurrentName(AppRouter.signUp)) {
        _submitButtonController.isFormValid =
            signUpFormKey.currentState!.validate();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  signUp() async {
    print("Signing new user");
    AuthResponse? authResponse = await _nhostAuthProvider.signUp(
      email: email,
      password: password,
      displayName: username,
    );
    if (authResponse?.session != null) {
      QR.toName(AppRouter.home);
      print(authResponse?.session?.user?.id);
    }
  }

  signIn() async {
    print("welcome back old user");
    AuthResponse? authResponse = await _nhostAuthProvider.signInEmailPassword(
      email: email,
      password: password,
    );
    if (authResponse?.session != null) {
      QR.toName(AppRouter.home);
      print(authResponse?.session?.user?.id);
    }
  }

  toggleObscureText() => _obscureText.toggle();
}
