import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShareContextLearn extends StatefulWidget {
  const ShareContextLearn({super.key});

  @override
  State<ShareContextLearn> createState() => _SharedContextLearnState();
}

enum _SecureKeys { token }

class _SharedContextLearnState extends State<ShareContextLearn> {
  final _storage = FlutterSecureStorage();
  final TextEditingController _controller = TextEditingController();
  String _title = '';

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print('Bu app önceden kullanılmış tokenı da bu');
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: Text('SAVE')),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
