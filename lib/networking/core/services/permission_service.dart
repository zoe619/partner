// import 'package:permission_handler/permission_handler.dart';

// class PermissionService {
//   /// Request Permission
//   /// [permission] Permission to request for.
//   static Future<bool> requestPermission(Permission permission) async {
//     if (await permission.isGranted) {
//       return true;
//     } else {
//       var result = await permission.request();
//       if (result == PermissionStatus.granted) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//   }
// }
