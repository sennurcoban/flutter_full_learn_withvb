import 'package:flutter_full_learn/404/bloc/future/login/model/login_model.dart';
import 'package:flutter_full_learn/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>?> login(LoginModel model);
  final _loginpath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>?> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginpath,
        data: model, parseModel: TokenModel(), method: RequestType.POST);
  }
}
