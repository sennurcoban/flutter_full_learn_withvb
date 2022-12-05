import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/303/testtable/user_save_model.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'req_res_test.mocks.dart';

@GenerateMocks([ReqresProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'sen': 'sennur'};
    SharedPreferences.setMockInitialValues(values);
  });
  // test(
  //   'saveToLocale - Test',
  //   () {
  //     var mockProvider = ReqresProvider(ReqresService(Dio()));
  //     final resourceContext = ResourceContext();
  //     final result = mockProvider.saveToLocale(resourceContext, []);

  //     expect(result, []);
  //   },
  // );

  test(
    'userTest - Test',
    () async {
      var userViewModel = UserSaveViewModel();
      // final result = userViewModel.getReadData('sen', SharedPrefStore(await SharedPreferences.getInstance()));
      final result = userViewModel.getReadData('sen', MockStore());

      expect(result, false);
    },
  );

  test(
    'fetchItems - Test',
    () async {
      var mockProvider = ReqresProvider(MockReqresService());
      // final result = userViewModel.getReadData('sen', SharedPrefStore(await SharedPreferences.getInstance()));
      final result = await mockProvider.fetchItems();

      expect(result, isNotEmpty);
    },
  );
}

class MockReqresService extends IReqresService {
  MockReqresService() : super(Dio());

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    return ResourceModel(data: [Data(color: 'a', id: 1)]);
  }
}
