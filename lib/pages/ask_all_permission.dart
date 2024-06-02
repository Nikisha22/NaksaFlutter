// permission_handler.dart
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (!status.isGranted) {
      throw 'Location permissions are required to proceed.';
    }
  }

  static Future<void> requestPhotoPermission() async {
    var status = await Permission.photos.request();
    if (!status.isGranted) {
      throw 'Photo permissions are required to proceed.';
    }
  }

  static Future<void> requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) {
      throw 'Camera permissions are required to proceed.';
    }
  }
}
