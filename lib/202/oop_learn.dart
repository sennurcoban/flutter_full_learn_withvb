import 'dart:io';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('object');
    return true;
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file); //contructors
}

// abstract:soyut sınıf