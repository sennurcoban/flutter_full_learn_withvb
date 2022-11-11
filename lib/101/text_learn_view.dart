import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key, required this.userName});
  final String name='sennur';

  final String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'Welcome $name ${name.length}',
            maxLines: 2, // max 2 satır olmasını istediğimizde
            overflow: TextOverflow.ellipsis, //eğer 2 satırdan büyük varsa yanına 3 nokta(...)
            textAlign: TextAlign.right,

            style: const TextStyle(
              wordSpacing: 2,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: Colors.green,
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.w600),
            ),
            Text(
            ('Hello $name ${name.length}'),
            maxLines: 2, // max 2 satır olmasını istediğimizde
            overflow: TextOverflow.ellipsis, //eğer 2 satırdan büyük varsa yanına 3 nokta(...)
            textAlign: TextAlign.right,

            style: ProjectStyles.welcomeStyle,
            ),
            Text(
            ('Hello $name ${name.length}'),
            maxLines: 2, // max 2 satır olmasını istediğimizde
            overflow: TextOverflow.ellipsis, //eğer 2 satırdan büyük varsa yanına 3 nokta(...)
            textAlign: TextAlign.right,

            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.amber),
            ),
            Text(userName ?? ' '),
          ],
        )),
    );
  }

}
class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: Colors.green,
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.w600

  );
}