import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> showPermissionDeniedDialog(
  BuildContext context,
  String permissionName,
) async {
  return showDialog(
 context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('permission Denied'),
        content: Text("youHaveDeniedPermission $permissionName"),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Open settings'),
            onPressed: () {
              HapticFeedback.mediumImpact();
              openAppSettings();
            },
          ),
        ],
      );
    },
  );
}
