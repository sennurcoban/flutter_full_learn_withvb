import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
    'List best of ',
    () {
      List<GenericUser> users = [
        GenericUser('sennur', '112233', 10000),
        GenericUser('seyma', '445566', 20000),
        GenericUser('zeynep', '889977', 25000)
      ];
      List<HighCard> highCards = users.map((e) {
        return HighCard(items: e.name.split('').toList());
      }).toList();

      try {
        final response = users.singleWhere(
          (element) => element.findUserName('x'),
          orElse: () {
            return GenericUser('name', 'id', 222);
          },
        );
        print(response);
      } catch (e) {
        print(e);
      }

      print('${users.where((element) => element.money > 500000)}');

      users.addAll([GenericUser('ayse', '56', 3000)]);
      users.lastWhere((element) => element.id == '112233');
      users.take(10);
      users.remove(GenericUser('sennur', '112233', 10000));
      users.removeAt(2);
      users.removeWhere((element) => element.id == '555');
      users.indexOf(GenericUser('sennur', '112233', 10000));
      final result = users.indexWhere((element) => element.id == '1');
      if (result >= 0) {
        users[result] = GenericUser('sennur', '112233', 10000);
      }
      users.expand((element) => [GenericUser('a', '2', 7000)]);
      //builder methodu gibi kullanılabilir
      // users.map((e) => e.money).where((element) => element > 5);
    },
  );

  test(
    'List best of with collection ',
    () {
      List<GenericUser> users = [
        GenericUser('sennur', '112233', 10000),
        GenericUser('seyma', '445566', 20000),
        GenericUser('zeynep', '889977', 25000)
      ];

      final response = users.singleWhereOrNull(
        (element) => element.findUserName('x'),
      );
      users.lastWhereOrNull((element) => element.id == '112233');
      users.lastOrNull;
      users.forEachIndexed((index, element) {});
      users.sample(3);
      print(users.contains(GenericUser('sennur', '112233', 10000)));
      print(response);
    },
  );
}
