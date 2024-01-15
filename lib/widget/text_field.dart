

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AppTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final bool expand;
  final TextInputType? textInput;
  final bool autoFocus;
  final TextInputAction inputAction;
  final TextEditingController? controller;
  final String hint;
  final double? size;
  final Function(String src) onChanged;

  AppTextField(
      {
        this.focusNode,
        required this.onChanged,
        required this.size,
        required this.hint,
        this.controller,
        this.expand = false,
        required this.textInput,
        this.autoFocus = false,
        this.inputAction =  TextInputAction.next});

  @override
  State<StatefulWidget> createState() => AppTextFieldSate();
}

class AppTextFieldSate extends State<AppTextField> {

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }


  @override
  Widget build(BuildContext context) {

  return TextField(
    focusNode: widget.focusNode,
    maxLines: null,
    autofocus: widget.autoFocus,
    textDirection: isRTL(widget.controller!.text) ? TextDirection.rtl : TextDirection.ltr,
    keyboardType: widget.textInput,
    controller: widget.controller,
    cursorHeight: widget.size! + 5,
    cursorColor: const Color(0xffC99180),
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: TextStyle(
            fontSize: widget.size,
        )
    ),
    style: TextStyle(
      fontSize: widget.size,
      fontWeight: FontWeight.bold,
    ),
    onChanged:widget.onChanged,
  );
}
}