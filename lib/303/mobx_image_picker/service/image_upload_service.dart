import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ImageUploadService {
  final Dio dio;
  ImageUploadService(this.dio);
  // https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  // https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fsennur.png
  Future<void> uploadImageService(Uint8List byteArray, String name, void Function(int, int)? onSendProgress) async {
    // var formData = FormData.fromMap({
    //   '': MultipartFile.fromBytes(byteArray),
    // });
    await dio.post(
      'full%2F$name.png',
      data: byteArray,
      onSendProgress: onSendProgress,
    );
  }
}
