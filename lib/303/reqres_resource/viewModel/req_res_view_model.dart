import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';

import '../../../product/service/network_manager.dart';
import '../model/reqres_model.dart';
import '../view/req_res_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    // reqresService = ReqresService(Dio(BaseOptions(baseUrl: 'https://reqres.in/api')));
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
