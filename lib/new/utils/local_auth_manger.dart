import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print("zzzzzz");
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    print("wwwwwwww");
    final isAvailable = await hasBiometrics();
    print(isAvailable);
    if (!isAvailable) return false;

    try {
      print("xxxx");
      return await _auth.authenticate(
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,



        ),
        localizedReason: 'قم بالضغط علي البصمة لتأكيد تسجيل الدخول',
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}