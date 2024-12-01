import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/features/auth/cubit/auth_state.dart';
import 'package:royal_home/features/auth/data/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState());
  final AuthRepository _authRepository;

  signUp(
      {required String emailOrPhoneNumber,
      required String password,
      required bool isEmail,
      required String firstName,
      required String lastName}) async {
    emit(state.copyWith(signupState: RequestStatus.loading));
    try {
      final response = await _authRepository.signUp(
          isEmail: isEmail,
          emailOrPhoneNumber: emailOrPhoneNumber,
          password: password,
          firstName: firstName,
          lastName: lastName);
      emit(state.copyWith(signupState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          signupState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  verifySignUp(
      {required String emailOrPhoneNumber,
      required String otp,
      required bool isEmail}) async {
    emit(state.copyWith(verifySignUpState: RequestStatus.loading));
    try {
      final response = await _authRepository.verifySignUp(
          emailOrPhoneNumber: emailOrPhoneNumber, otp: otp, isEmail: isEmail);
      emit(state.copyWith(verifySignUpState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          verifySignUpState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  login(
      {required String emailOrPhoneNumber,
      required String password,
      required bool isEmail}) async {
    emit(state.copyWith(loginState: RequestStatus.loading));
    try {
      final response = await _authRepository.login(
        password: password,
        isEmail: isEmail,
        emailOrPhoneNumber: emailOrPhoneNumber,
      );
      emit(state.copyWith(loginState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          loginState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  loginWithOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    emit(state.copyWith(loginWithOTPState: RequestStatus.loading));
    try {
      final response = await _authRepository.loginWithOTP(
          phoneNumber: phoneNumber, otp: otp);
      emit(state.copyWith(loginWithOTPState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          loginWithOTPState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  loginWithGoogle() async {
    emit(state.copyWith(loginWithGoogleState: RequestStatus.loading));
    try {
      final response = await _authRepository.sendIdTokenGoogle();
      emit(state.copyWith(loginWithGoogleState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          loginWithGoogleState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  sendPhoneOtp({required String phone}) async {
    emit(state.copyWith(sendOtpState: RequestStatus.loading));
    try {
      final response = await _authRepository.sendPhoneOtp(phone: phone);
      emit(state.copyWith(sendOtpState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          sendOtpState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  forgetPassword({required String email, required bool isEmail}) async {
    emit(state.copyWith(forgetPasswordState: RequestStatus.loading));
    try {
      final response = await _authRepository.forgetPassword(email: email);
      emit(state.copyWith(forgetPasswordState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          forgetPasswordState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  verifyForgetPassword(
      {required String email,
      required String code,
      required bool isEmail}) async {
    emit(state.copyWith(
        verifyForgetPasswordByEmailState: RequestStatus.loading));
    try {
      final response =
          await _authRepository.verifyForgetPassword(email: email, code: code);
      emit(state.copyWith(
          verifyForgetPasswordByEmailState: RequestStatus.loaded,
          resetPasswordToken: response));
    } on DioException catch (e) {
      emit(state.copyWith(
          verifyForgetPasswordByEmailState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  resetPassword({required String token, required String newPassword}) async {
    emit(state.copyWith(resetPasswordState: RequestStatus.loading));
    try {
      final response = await _authRepository.resetPassword(
          token: token, newPassword: newPassword);
      emit(state.copyWith(resetPasswordState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          resetPasswordState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  logout() async {
    emit(state.copyWith(logoutState: RequestStatus.loading));
    try {
      await _authRepository.logout();
    } on DioException catch (e) {
      emit(state.copyWith(
          logoutState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }

  logoutGoole() {
    emit(state.copyWith(logoutState: RequestStatus.loading));
    try {
      _authRepository.logoutGoogle();
    } on DioException catch (e) {
      emit(state.copyWith(
          logoutState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }
}
