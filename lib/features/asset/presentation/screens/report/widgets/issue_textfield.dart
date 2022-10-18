// ignore_for_file: must_be_immutable

import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class EnterIssuesTextField extends StatelessWidget {
  int? numberOfLetters;
  int? maxlines;
  String text;
  double height;
  Widget? dropdownmenu;
  Widget? suffixicon;
  TextEditingController controller;
  void Function(String) onchange;

  EnterIssuesTextField({
    Key? key,
    required this.text,
    required this.height,
    required this.onchange,
    required this.controller,
    this.suffixicon,
    this.dropdownmenu,
    this.numberOfLetters,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: controller,
        onChanged: onchange,
        maxLines: 6,
        maxLength: numberOfLetters,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBluishGrey),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: kGrey)),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          fillColor: kWhite,
          hintText: text,
          suffix: dropdownmenu,
        ),
      ),
    );
  }
}
