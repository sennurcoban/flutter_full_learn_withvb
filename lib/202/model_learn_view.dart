import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  PostModel8 user9 = PostModel8(body: 'aa');
  @override
  void initState() {
    super.initState();

    // final user1 = PostModel1();
    // ..userId=1
    // ..body='sc';
    // user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.id = 3;

    final user3 = PostModel3(5, 4, 'a', 'd');
    // user3.body = 'cc'; // tekrar değer atayamayız çünkü final

    //localde çalışıyorsak bu modeller olabilir
    //local dataları güncelliyceksek
    //class içerisinde func yazıp update metotları ekleyerek güncellemelerimizi yapabiliriz
    final user4 = PostModel4(userId: 3, id: 1, title: 'c', body: 'e');
    // user4.id = 8;// tekrar değer atayamayız çünkü final

    final user5 = PostModel5(userId: 9, id: 4, title: 'sennur', body: 'merhaba');
    // user5. //private variable
    // user5.userId; // propertymizi koruyup güncelleyebiliriz
    ////encapsulation yaptık değer userIdi görebiliriz kendi yazdığımız kuralla

    final user6 = PostModel6(userId: 55, id: 11, title: 'title', body: 'body');
    final user7 = PostModel7(); // değer vermedğimiz için default değelrini alır

    //servis kullanıyorsak en doğru işlem bu
    final user8 = PostModel8(body: 'aa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: 'sc');
          user9.updateBody(null);
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not have a data'),
      ),
    );
  }
}
