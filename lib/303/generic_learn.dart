// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(0, (previousValue, element) => previousValue + element);
    final _money = users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    return _money;
  }

  Iterable<SCModel<R>>? showNames<R>(List<GenericUser> users) {
    //sadece rol 1 olanlar
    if (R == String) {
      final names = users.map((e) => SCModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }

    return null;
  }
}

class SCModel<T> {
  final String name = 'sc';
  final List<T> items;

  SCModel(this.items);
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
