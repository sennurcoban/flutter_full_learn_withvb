import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;
  ImageUploadService(this.dio);
  // https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  // https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fsennur.png
  Future<ImageUploadResponse?> uploadImageService(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    // var formData = FormData.fromMap({
    //   '': MultipartFile.fromBytes(byteArray),
    // });
    final response = await dio.post(
      'full%2F$name.png',
      data: byteArray,
      onSendProgress: onSendProgress,
    );
    if (response.statusCode == HttpStatus.ok) {
      // final responseData = null check
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
