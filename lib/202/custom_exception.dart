class FileDownloadException implements Exception {
  @override
  String toString() {
    return 'File download has failed';
  }
}
//implents(bir classtan diğer classı copy etme) : bunun bir ana özellikleri var, 
//bunları buraya entegtre ettim yani Exceptionın bütün özelliklerini aldım ben burda kullanıyorum
