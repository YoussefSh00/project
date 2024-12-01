String? validatorRequired(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Required Field";
  }
  return null;
}

String? validatorName(String? value) {
  // var  validCharacters = RegExp("/[-._!"`'#%&,:;<>=@{}~\$\(\)\*\+\/\\\?\[\]\^\|]+/");
  if (value == null || value.trim().isEmpty) {
    return "Enter Name";
  } else if (value.trim().contains(RegExp(r'[!@#$%^&*(),.؟؛?":{}|<>0-9،]'))) {
    return "Field mush not have any special characters or number";
  } else if (value.trim().length < 3) {
    return "Field should contain at least 3 character";
  }
  return null;
}

String? validatorPassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Enter Password";
  } else if (value.trim().length < 8) {
    return "password should contain at least 8 character";
  }
  return null;
}

String? validatorRePassword(String? value, String? newValue) {
  if (value != newValue) {
    //return translate(AppStrings.carPlate);
    return "Wrong the same Password";
  }
  return null;
}

String? validatorConfirmPassword(String? value, String? newValue) {
  if (value != newValue) {
    //return translate(AppStrings.carPlate);
    return "Wrong not match Password";
  }
  return null;
}

String? validatorPhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "login";
  } else if (value.trim().length < 9) {
    return "login";
  }
  return null;
}

String? validatorCardNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "required Card Number";
  } else if (value.trim().length < 19) {
    return "Card Number should contain at least 16 number";
  }
  return null;
}

String? validatorEndDate(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "required Expiry date";
  } else if (value.trim().length < 5) {
    return "please enter Expiry date";
  }
  return null;
}

String? validatorCVVNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "required CVV Number";
  } else if (value.trim().length < 3) {
    return "please enter CVV Number";
  }
  return null;
}

String? validatorEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Required Email";
  } else if (!regExp.hasMatch(value)) {
    return "Not Valid Email";
  }
  return null;
}

String? isPasswordValid(String? password) {
  if (!password!.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>=\-_]'))) {
    return "Password should not contain special characters";
  }
  return null;
}

String? combinedPasswordValidator(String? value) {
  String? validationMessage = validatorPassword(value);
  if (validationMessage != null) {
    return validationMessage;
  }

  // Check if password contains special characters
  validationMessage = isPasswordValid(value);
  if (validationMessage != null) {
    return validationMessage;
  }

  return null;
}
