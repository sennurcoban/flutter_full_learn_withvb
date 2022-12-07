import 'package:flutter_full_learn/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

class VexanaNetworkManager extends NetworkManager<TokenModel> {
  VexanaNetworkManager() : super(options: BaseOptions(baseUrl: 'https://reqres.in/'));
}
