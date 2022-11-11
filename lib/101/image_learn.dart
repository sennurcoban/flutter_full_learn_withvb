import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imagePath = 'https://upload.wikimedia.org/wikipedia/Apple-book.svg/1018px-Apple-book.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
          height: 100,
          width: 300,
          child: PngImage(name: ImageItems().appleBookWithoutPath),),
          Image.network('https://upload.wikimedia.org/wikipedia/Apple-book.svg/1018px-Apple-book.svg.png',
          errorBuilder: (context, error, stackTrace) { return PngImage(name: ImageItems().appleBookWithoutPath);}
          ),
          
        ],
      ),
    );
  }
}

class ImageItems{
  final String appleWithBook = "assets/apple-and-book-png-transparent.png";
  final String appleBook = "assets/png/ic_apple_book.png";
  final String appleBookWithoutPath = "ic_apple_book";


}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath,fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/png/$name.png';
}