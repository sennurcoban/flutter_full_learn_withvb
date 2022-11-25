import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/service/network_manager.dart';
import 'package:provider/provider.dart';
import '../model/reqres_model.dart';
import '../service/reqres_service.dart';
import '../viewModel/asy_view_model.dart';

class ASYView extends StatefulWidget {
  const ASYView({super.key});

  @override
  State<ASYView> createState() => _ASYViewState();
}

// class _ASYViewState extends ASYViewModel {
class _ASYViewState extends State<ASYView> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ASYService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
              title: context.watch<ReqresProvider>().isLoading
                  ? CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : null),
          body: _resourceListView(context, context.watch<ReqresProvider>().resources),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<DataReqres> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(items[index].name ?? ''),
        );
      },
    );
  }
}
