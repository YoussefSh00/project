import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:royal_home/core/services/remote/api_service.dart';
import 'package:royal_home/features/auth/data/models/signup_response.dart';
import 'package:royal_home/features/auth/data/models/user_respones.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<void> storeTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  Future<void> refreshToken() async {
    final refreshToken = await getRefreshToken();
    final response = await _apiService.refreshToken(refreshToken!);

    final authResponse = UserResponse.fromJson(response.data);
    await storeTokens(authResponse.accessToken!, authResponse.refreshToken!);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('accessToken');
    log("Retrieved access token: $token");
    return token;
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    log("Retrieved refresh token: $refreshToken");
    return refreshToken;
  }

//done tested
  Future<SignupResponse> signUp(
      {required String emailOrPhoneNumber,
      required bool isEmail,
      required String password,
      required String firstName,
      required String lastName}) async {
    final response = await _apiService.post(
      "users/user/auth/public/signup",
      {
        isEmail ? "email" : "phoneNumber": emailOrPhoneNumber,
        'password': password,
        'firstName': firstName,
        'lastName': lastName
      },
      requiresAuth: false,
    );

    final authResponse = SignupResponse.fromJson(response.data);
    return authResponse;
  }

//done tested
  Future<UserResponse> verifySignUp(
      {required String emailOrPhoneNumber,
      required String otp,
      required bool isEmail}) async {
    final response = await _apiService.post(
      isEmail
          ? "users/user/auth/public/verify-signup-email"
          : "users/user/auth/public/verify-signup-mobile",
      {isEmail ? 'email' : 'phoneNumber': emailOrPhoneNumber, 'code': otp},
      requiresAuth: false,
    );
    final userResponse = UserResponse.fromJson(response.data);

    return userResponse;
  }

//done tested
  Future<UserResponse> login(
      {required String emailOrPhoneNumber,
      required bool isEmail,
      required String password}) async {
    final response = await _apiService.post(
      "users/user/auth/public/login",
      {
        isEmail ? "email" : 'phoneNumber': emailOrPhoneNumber,
        "password": password,
      },
      requiresAuth: false,
    );
    final userResponse =
        UserResponse.fromJson(response.data["payload"]["data"]);
    await storeTokens(userResponse.accessToken!, userResponse.refreshToken!);

    return userResponse;
  }

  Future<UserResponse> loginWithOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    final response = await _apiService.post(
      "users/user/auth/public/login-mobile-otp",
      {
        'phoneNumber': phoneNumber,
        'code': otp,
      },
      requiresAuth: false,
    );
    final userResponse = UserResponse.fromJson(response.data);
    await storeTokens(userResponse.accessToken!, userResponse.refreshToken!);

    return userResponse;
  }

//done
  Future<void> sendPhoneOtp({required String phone}) async {
    final response = await _apiService.post(
      "users/user/auth/private-auth/send-mobile-otp",
      {'phoneNumber': phone},
      requiresAuth: false,
    );
  }

//done
  Future<void> forgetPassword({required String email}) async {
    final response = await _apiService.post(
      "users/user/auth/public/forget-password",
      {"email": email},
      requiresAuth: false,
    );
  }

//done
  Future<String> verifyForgetPassword({
    required String email,
    required String code,
  }) async {
    final response = await _apiService.post(
      "users/user/auth/public/verify-forget-password-email",
      {"email": email, 'code': code},
      requiresAuth: false,
    );
    final user = response.data['payload']['data']["accessToken"];

    return user;
  }

  Future<void> resetPassword(
      {required String token, required String newPassword}) async {
    final response = await _apiService.post(
      "users/user/auth/private-auth/reset-password",
      {"accessToken": token, 'newPassword': newPassword},
      requiresAuth: false,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> sendIdTokenGoogle() async {
    UserCredential userCredential = await signInWithGoogle();
    String? idToken = await userCredential.user!.getIdToken();
    print("Id token: $idToken");
    var response = await _apiService.post(
        "users/user/auth/public/sso/google/login", {"idToken": idToken},
        requiresAuth: false);
  }

  Future<void> logoutGoogle() async => await GoogleSignIn().signOut();

//done
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }
}
