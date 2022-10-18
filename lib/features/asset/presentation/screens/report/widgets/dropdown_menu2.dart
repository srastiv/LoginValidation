import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final List<String> items = [
  'MacBook Pro i7',
  'Samsung Monitor 24"',
  'MacBook Charger',
  'Lightning Cable',
];
String? selectedValue;

class DropDownButtonTwo extends StatefulWidget {
  const DropDownButtonTwo({Key? key}) : super(key: key);

  @override
  State<DropDownButtonTwo> createState() => _DropDownButtonTwoState();
}

class _DropDownButtonTwoState extends State<DropDownButtonTwo> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 328,
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: kLightBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton2(
          hint: const Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: kDarkGrey,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
        ),
      ),
    );
  }
}
