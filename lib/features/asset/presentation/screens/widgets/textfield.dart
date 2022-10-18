// ignore_for_file: must_be_immutable

import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterDetailsTextField extends StatelessWidget {
  int? numberOfLetters;
  String text;
  double height;
  Widget? dropdownmenu;
  TextEditingController controller;
  void Function(String) onchange;

  EnterDetailsTextField({
    Key? key,
    required this.text,
    required this.height,
    required this.onchange,
    required this.controller,
    this.dropdownmenu,
    this.numberOfLetters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        onChanged: onchange,
        maxLines: 6,
        maxLength: numberOfLetters,
        // inputFormatters: [
        //   LengthLimitingTextInputFormatter(45),
        // ],
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
