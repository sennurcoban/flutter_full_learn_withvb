import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio; //değerini bir kere alıcak bir daha eşitlenmeyecek
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts',data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: 'Body'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: 'UserId'),),

            TextButton(onPressed: 
            _isLoading ? null 
            : (){
              if (
                _titleController.text.isNotEmpty && 
                _bodyController.text.isNotEmpty &&
                _userIdController.text.isNotEmpty
              ) {
                final model = PostModel(
                  title: _titleController.text, 
                  body: _bodyController.text, 
                  userId: int.tryParse(_userIdController.text));

                _addItemToService(model);
              }
            }, child: Text('Send')),
        ]),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  }) : _model = model, super(key: key);

  final PostModel? _model; // private yaptık constructor anında bu değeri veriyor- bu sayede late atmasına gerek kalmaz

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
