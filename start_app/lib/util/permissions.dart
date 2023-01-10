import 'package:permission_handler/permission_handler.dart';

handleCameraPermission() async {
  final PermissionStatus status = await Permission.contacts.status;
  final camera = await Permission.camera.status;
  print(status);

  if (status != PermissionStatus.granted) {
    await Permission.contacts.request();
  }
  if (camera != PermissionStatus.granted) {
    await Permission.camera.request();
  }
}
