import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/network_manager.dart';
import 'package:provider/provider.dart';
import '../model/reqres_model.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../viewModel/req_res_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

// class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .read<ReqresProvider>()
                          .saveToLocale(context.read<ResourceContext>(), context.read<ReqresProvider>().resources);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) {
                          return ImageLearn();
                        },
                      ));
                    },
                    icon: Icon(Icons.ac_unit))
              ],
              title: context.watch<ReqresProvider>().isLoading
                  ? CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : null),
          body: Column(
            children: [
              Selector<ReqresProvider, bool>(builder: (context, value, child) {
                return value ? Placeholder() : Text('data');
              }, selector: (context, provider) {
                return provider.isLoading;
              }),
              Expanded(child: _resourceListView(context, context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
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
