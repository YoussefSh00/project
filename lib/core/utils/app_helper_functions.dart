// Email validator
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKeyAlice = GlobalKey<NavigatorState>();

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

bool isTokenExpired(String token) {
  var expDate = JwtDecoder.getExpirationDate(token);

  bool isExpired =
      expDate.isBefore(DateTime.now().add(Duration(minutes: 1))) ? true : false;

  return isExpired;

  // bool isExpired = JwtDecoder.isExpired(token);
  // return isExpired;
}

dynamic removeNullAndEmptyValues(dynamic json) {
  if (json is Map<String, dynamic>) {
    final Map<String, dynamic> cleanedMap = {};
    json.forEach((key, value) {
      if (value != null) {
        final cleanedValue = removeNullAndEmptyValues(value);
        if (cleanedValue is Map && cleanedValue.isEmpty) {
        } else if (cleanedValue is List && cleanedValue.isEmpty) {
        } else {
          cleanedMap[key] = cleanedValue;
        }
      }
    });
    return cleanedMap;
  } else if (json is List) {
    return json
        .where((item) => item != null)
        .map((item) => removeNullAndEmptyValues(item))
        .where((item) => !(item is Map && item.isEmpty))
        .where((item) => !(item is List && item.isEmpty))
        .toList();
  } else {
    return json;
  }
}

void setIsUserSeenOnBoarding(bool isSeen) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("onBoarding", isSeen);
}

Future<bool> getIsUserSeenOnBoarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool("onBoarding");
  return seen ?? false;
}
