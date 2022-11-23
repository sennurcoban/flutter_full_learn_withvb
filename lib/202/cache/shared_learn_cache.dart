import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;
  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value); //_value bunu parse edibilirse null değer gelmiycek
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Theme.of(context).bottomAppBarColor),
                )
              : SizedBox.shrink()
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (() async {
          changeLoading();
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setInt('counter', _currentValue);
          await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        }));
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: (() async {
          changeLoading();
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.remove('counter');
          await _manager.removeItem(SharedKeys.counter);
        }));
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('sennur', 'vnvnv', 'sc.dev'),
      User('seyma', 'cbcbc', 'sc.dev'),
      User('seyda', 'vnkskskvnv', 'sc.dev'),
    ];
  }
}

// <T>-GENERIC
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
