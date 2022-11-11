import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: Text('Save', style: Theme.of(context).textTheme.subtitle1),
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.red;
            })),
            onPressed: () {},
          ),
          const ElevatedButton(onPressed: null, child: Text('data')),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: () {
              //servise istek at
              //sayfanın rengini düzenleme
            },
            child: const Icon(Icons.interests_outlined),
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: const EdgeInsets.all(15),
                // shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: const SizedBox(width: 100, child: Text('save'))),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: Text('sennur')),
          InkWell(onTap: () {}, child: const Text('buton')),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.black, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)) )),
            onPressed: () {}, child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,right: 40,left:40),
              child: Text('Place Bid', style: Theme.of(context).textTheme.headline3),
            ),)
        ],
      ),
    );
  }
}

// Borders:
// CircleBorder(),RoundedRectangleBorder()