class UserResponse {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? id;
  final String? accessToken;
  final String? refreshToken;

  UserResponse(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.id,
      required this.accessToken,
      required this.refreshToken});
  factory UserResponse.fromJson(json) {
    return UserResponse(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      id: json['_id'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
