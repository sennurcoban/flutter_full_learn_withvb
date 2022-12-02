import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:flutter_full_learn/product/utility/image_upload.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath = 'https://assets2.lottiefiles.com/packages/lf20_urbk83vw.json';
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading ? CircularProgressIndicator() : SizedBox();
          })
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Card(
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return _imageUploadViewModel.file != null ? Image.file(_imageUploadViewModel.file!) : SizedBox();
                    },
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    child: IconButton(
                        onPressed: () async {
                          _imageUploadViewModel.saveLocalFile(await _imageUploadManager.fetchFromLibrary());
                        },
                        icon: Lottie.network(_imageUploadLottiePath)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Expanded(
          flex: 4,
          child: SizedBox(),
        )
      ]),
    );
  }
}
