import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller; 
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText ='*';
  bool _isSecure = true;// bu component acıldığında aslında secure açılacak

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      //değeri yakalasın diye controller alırız
      controller: widget.controller, //üst classtan bunu oku buraya da ver
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure, //yazılan değerleri gizlemek için default-...
      obscuringCharacter: _obscureText, // yazılan şifreyi **** şeklinde gösterir, özelleştirme
      decoration: InputDecoration(border: UnderlineInputBorder(),hintText: 'Password',
      suffix: _onVisibilityIcon(),
      ),
    );
    
  }

  IconButton _onVisibilityIcon() {
    return IconButton(onPressed: _changeLoading,
    icon: AnimatedCrossFade(
      firstChild: Icon(Icons.visibility_outlined), 
      secondChild: Icon(Icons.visibility_off_outlined), 
      crossFadeState:_isSecure? CrossFadeState.showFirst : CrossFadeState.showSecond, //animasyon geçişi
      duration: Duration(seconds: 2)),
    // icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off)
    
    );
  }
}