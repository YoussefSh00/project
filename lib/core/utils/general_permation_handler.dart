import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


import 'package:device_info_plus/device_info_plus.dart';
import 'package:royal_home/core/components/show_permission_denied_dialog.dart';

class GeneralPermissionHandler {


  // Function to request media permission
  Future<bool> requestMediaPermission(BuildContext context) async {
    final isAndroid = Platform.isAndroid;
    final sdkIsLessThan32 = isAndroid
        ? (await DeviceInfoPlugin().androidInfo).version.sdkInt <= 32
        : false;

    if (!isAndroid) {
      final requestPhotosStatus = await Permission.photos.request();

      if (requestPhotosStatus.isGranted || requestPhotosStatus.isLimited)
        return true;

      if (requestPhotosStatus.isPermanentlyDenied ||
          requestPhotosStatus.isDenied) {
        await showPermissionDeniedDialog(
          context,
          'Media',
        );
        return false;
      }
    }

    if (sdkIsLessThan32) {
      final requestStatus = await Permission.storage.request();
      if (requestStatus.isGranted) return true;

      if (requestStatus.isPermanentlyDenied || requestStatus.isDenied) {
        await showPermissionDeniedDialog(
        context,
          'Storage',
        );
        return false;
      }
    } else {
      final requestPhotosStatus = await Permission.photos.request();
      final requestVideosStatus = await Permission.videos.request();

      if (requestPhotosStatus.isGranted && requestVideosStatus.isGranted) {
        return true;
      }

      if (requestPhotosStatus.isPermanentlyDenied ||
          requestPhotosStatus.isDenied ||
          requestVideosStatus.isPermanentlyDenied ||
          requestVideosStatus.isDenied) {
        await showPermissionDeniedDialog(
          context,
          'Media',
        );
        return false;
      }
    }

    return false;
  }

  // Function to request storage permission
  Future<bool> requestStoragePermission() async {
    final requestStatus = await Permission.storage.request();

    if (requestStatus.isGranted) return true;

    if (requestStatus.isPermanentlyDenied || requestStatus.isDenied) {
      // await showPermissionDeniedDialog(
      //   context,
      //   'Storage',
      // );
      return false;
    }

    return false;
  }

}
