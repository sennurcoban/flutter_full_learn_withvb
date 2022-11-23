import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
    'User Calculate',
    () {
      final users = [
        GenericUser('sennur', '112233', 10000),
        GenericUser('seyma', '445566', 20000),
        GenericUser('zeynep', '889977', 25000)
      ];
      final userManagement = UserManagement(AdminUser('name', '1', 10, 1));
      final result = userManagement.calculateMoney(users);
      final response = userManagement.showNames<String>(users);
      expect(result, 55010);
    },
  );
}
