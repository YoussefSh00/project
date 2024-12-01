import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';

class AuthState {
  final RequestStatus? signupState;
  final RequestStatus? loginState;
  final RequestStatus? loginWithOTPState;
  final RequestStatus? loginWithGoogleState;

  final RequestStatus? refreshTokenState;
  final RequestStatus? verifyOtpState;
  final RequestStatus? sendOtpState;
  final RequestStatus? resendOtpState;
  final RequestStatus? changePasswordState;
  final RequestStatus? forgetPasswordState;
  final RequestStatus? resetPasswordState;
  final RequestStatus? verifySignUpState;
  final RequestStatus? resendSignUpState;
  final RequestStatus? verifyForgetPasswordByEmailState;
  final String? resetPasswordToken;
  final RequestStatus? logoutState;

  final ErrorMessageModel? errorMessageModel;

  AuthState( {
    this.resetPasswordToken,
    this.signupState = RequestStatus.initial,
    this.loginState = RequestStatus.initial,
    this.loginWithOTPState = RequestStatus.initial,
    this.loginWithGoogleState = RequestStatus.initial,
    this.refreshTokenState = RequestStatus.initial,
    this.verifyOtpState = RequestStatus.initial,
    this.sendOtpState = RequestStatus.initial,
    this.resendOtpState = RequestStatus.initial,
    this.changePasswordState = RequestStatus.initial,
    this.forgetPasswordState = RequestStatus.initial,
    this.resetPasswordState = RequestStatus.initial,
    this.verifySignUpState = RequestStatus.initial,
    this.resendSignUpState = RequestStatus.initial,
    this.verifyForgetPasswordByEmailState = RequestStatus.initial,
    this.logoutState = RequestStatus.initial,
    this.errorMessageModel,
  });

  AuthState copyWith({
    RequestStatus? signupState,
    RequestStatus? loginState,
    RequestStatus? loginWithOTPState,
    RequestStatus? loginWithGoogleState,
    RequestStatus? refreshTokenState,
    RequestStatus? verifyOtpState,
    RequestStatus? sendOtpState,
    RequestStatus? resendOtpState,
    RequestStatus? changePasswordState,
    RequestStatus? forgetPasswordState,
    RequestStatus? verifyForgetPasswordState,
    RequestStatus? resetPasswordState,
    RequestStatus? verifySignUpState,
    RequestStatus? resendSignUpState,
    RequestStatus? verifyForgetPasswordByEmailState,
    String? resetPasswordToken,
    RequestStatus? logoutState,
    ErrorMessageModel? errorMessageModel,
  }) {
    return AuthState(
      signupState: signupState ?? this.signupState,
      loginState: loginState ?? this.loginState,
      loginWithOTPState: loginWithOTPState ?? this.loginWithOTPState,
      loginWithGoogleState: loginWithGoogleState ?? this.loginWithGoogleState,
      refreshTokenState: refreshTokenState ?? this.refreshTokenState,
      verifyOtpState: verifyOtpState ?? this.verifyOtpState,
      sendOtpState: sendOtpState ?? this.sendOtpState,
      resendOtpState: resendOtpState ?? this.resendOtpState,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      verifySignUpState: verifySignUpState ?? this.verifySignUpState,
      resendSignUpState: resendSignUpState ?? this.resendSignUpState,
      verifyForgetPasswordByEmailState: verifyForgetPasswordByEmailState ??
          this.verifyForgetPasswordByEmailState,
      logoutState: logoutState ?? this.logoutState,
      errorMessageModel: errorMessageModel ?? this.errorMessageModel,
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
    );
  }
}
