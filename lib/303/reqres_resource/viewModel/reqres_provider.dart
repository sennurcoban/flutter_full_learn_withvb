import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/reqres_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IASYService asyService;

  List<DataReqres> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.asyService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await asyService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }
}
