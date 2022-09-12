import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;
  String errorText;
  void Function(String mystring) changedValue;

  TextFieldWidget(
      {required this.email,
      required this.icon,
      required this.inputType,
      required this.password,
      required this.errorText,
      required this.changedValue});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[700], fontFamily: 'Comfortaa'),
      //   textInputAction: TextInputAction.next,
      onChanged: widget.changedValue,
      cursorColor: Color(0xFF3E6EA4),
      obscureText: widget.password,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1,color: Colors.black),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1,color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1,color: Colors.black),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1,)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1,color: Colors.black)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1,color: Colors.black)
          ),

          errorText: widget.errorText,
          // border: InputBorder.none,
          hintText: widget.email,
          // prefix: Icon(Icons.eleven_mp_rounded),
          contentPadding: EdgeInsets.only(left: 10),
          icon: Padding(
            padding: EdgeInsets.only(bottom: 0.0),
            child: Icon(
              widget.icon,
              color: Color(0xFF3E6EA4),
              size: 30,
            ),
          ),
          labelStyle: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Comfortaa',
              letterSpacing: 3,
              color: Colors.green[700],
              fontWeight: FontWeight.w900)),
      keyboardType: widget.inputType,
    );
  }
}
