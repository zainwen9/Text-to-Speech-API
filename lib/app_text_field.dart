import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextField(
    {required String mYhintText,
    myControler,
    fieldValidator,
    onchange,
    TextInputAction? action,
    bool issufiz = false,
    bool isenable = true,
    Widget? sufixWidgit,
    List<TextInputFormatter>? inputparamerts,
    bool? removeBorder,
    Color? hintColor,
    required keyBordType,
    required maxLiness,
    required String? Function(dynamic value) fieldvalivator}) {
  return TextFormField(
    textInputAction: action ?? TextInputAction.done,
    inputFormatters: inputparamerts ?? [],
    validator: fieldValidator,
    onChanged: onchange ?? (val) {},
    maxLines: maxLiness,
    keyboardType: keyBordType,
    controller: myControler,
    decoration: InputDecoration(
        enabled: isenable,
        suffixIcon: sufixWidgit,
        hintText: mYhintText,
        //labelText: mYhintText,
        hintStyle: TextStyle(color: hintColor ?? Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        filled: true,
        fillColor: removeBorder == true ? Colors.white : Colors.white,
        focusColor: removeBorder == true ? Colors.white : Colors.white,
        hoverColor: removeBorder == true ? Colors.white : Colors.white,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: removeBorder == true ? Colors.transparent : Colors.blue,
              width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: removeBorder == true ? Colors.transparent : Colors.blue,
              width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: removeBorder == true ? Colors.transparent : Colors.blue,
              width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: removeBorder == true ? Colors.transparent : Colors.blue,
              width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        )),
  );
}
