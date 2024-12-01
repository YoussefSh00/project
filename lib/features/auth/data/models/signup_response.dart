class SignupResponse {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  SignupResponse(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  factory SignupResponse.fromJson(json) {
    return SignupResponse(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
