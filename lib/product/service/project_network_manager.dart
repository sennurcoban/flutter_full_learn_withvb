import 'package:dio/dio.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }
  late final Dio _dio;
  //lazy-> doğrudan eşitlediğimizde
  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  //data aldım bu datayı tüm servislerime eklemek istiyorum ve bütün requestlerimde bu olcak
  //token->login olduktan sonra gelen data
  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}

//bu data gelmeyebilir ama gelirse de projede bir tane olmasını istiyorum
//shared manager tarafında cok kullanıyoruz
//eager->kullanım sekli
class DurationManager {
  DurationManager._();
  static DurationManager? _manager;
  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  }
}
