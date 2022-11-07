import 'package:flutter/material.dart';

class CustomLogin extends StatefulWidget {
  final String? hinText;
  final IconButton? icon;
  final bool isPass;
  bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  CustomLogin(
      {Key? key,
      this.hinText,
      this.icon,
      this.obscureText = false,
      required this.formProperty,
      required this.formValues,
      this.isPass = false
      })
      : super(key: key);

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      obscureText: widget.obscureText,
      onChanged: (value) {
        widget.formValues[widget.formProperty] = value;

        print('value: $value');
      },
      validator: (value) {
        if (value!.isEmpty) return 'Este campo es requerido';
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: widget.hinText,
        //prefixIcon: Icon(Icons.verified_user_outlined),
        suffixIcon: 
        widget.isPass? 
        IconButton(
          icon: Icon(
              widget.obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            widget.obscureText = !widget.obscureText;
            setState(() {});
          },
        ) : null
      ),
    );
  }
}
