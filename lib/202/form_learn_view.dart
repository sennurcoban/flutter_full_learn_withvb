import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode:
            AutovalidateMode.always, //text girdğimizide'Bu alan boş geçilemez!' yazısını gizlememizi sağlar
        onChanged: () {},
        child: Column(children: [
          TextFormField(validator: FormFieldValidator().isNotEmpty),
          TextFormField(validator: FormFieldValidator().isNotEmpty),
          DropdownButtonFormField<String>(
            validator:  FormFieldValidator().isNotEmpty,//seçim yapabilmek için ekledik
            items: const [
              DropdownMenuItem(child: Text('aa'), value: '22'),
              DropdownMenuItem(child: Text('bb'), value: '21'),
          ], onChanged: (value) {}),
          ElevatedButton(
            onPressed: () {
              if (_key.currentState?.validate() ?? false) {
                print('okey');
              }
            },
            child: Text('Save'),
          ),
        ]),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Bu alan boş geçilemez!';
  }
}
