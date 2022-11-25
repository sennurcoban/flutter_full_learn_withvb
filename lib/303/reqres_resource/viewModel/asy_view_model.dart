import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';

import '../../../product/service/network_manager.dart';
import '../model/reqres_model.dart';
import '../view/asy_view.dart';

abstract class ASYViewModel extends LoadingStatefull<ASYView> with ProjectDioMixin {
  late final IASYService asyService;

  List<DataReqres> resources = [];
  @override
  void initState() {
    super.initState();
    asyService = ASYService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await asyService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
