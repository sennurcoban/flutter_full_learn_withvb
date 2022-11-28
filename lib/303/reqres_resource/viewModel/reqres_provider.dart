import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

import '../model/reqres_model.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  //Dataları locale save etmek istiyorum,bana context lazım(instance)
  //view model layerlerine yazmak zorunda değiliz
  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
