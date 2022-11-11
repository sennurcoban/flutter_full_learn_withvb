import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            autofillHints: [AutofillHints.email],
            focusNode: focusNodeTextFieldOne,
            // inputFormatters: [TextProjectInputFormatter()._formater],
            textInputAction: TextInputAction.next,
            decoration: _InputDecorator().emailInput,
              // fillColor: Colors.white,
              // filled: true,
            
          ),
          SizedBox(height: 10,),
          TextFormField(
            maxLines: 4,
            minLines: 2,
            focusNode: focusNodeTextFieldTwo,
          )
        ],
      ),
    );
  }
  

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      
      key: key,
      duration: Duration(milliseconds: 100),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.green,
    );
  }
}

// class TextProjectInputFormatter {
//   final _formater = TextInputFormatter.withFunction((oldValue, newValue) {
//     if (newValue.text == "a") {
//       return oldValue;
//     }
//     return oldValue;
//   });
// }

class _InputDecorator {
  final emailInput = const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              labelText: LanguageItems.mailTitle,
              // fillColor: Colors.white,
              // filled: true,
            );
}