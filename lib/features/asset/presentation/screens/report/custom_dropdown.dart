import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({Key? key, required this.selection}) : super(key: key);
  String selection;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        isDense: true,
        value: widget.selection,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.brown,
        ),
        iconSize: 40,
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        onChanged: (val) => setState(() => widget.selection = val.toString()),
        items: <String>['Macbook', 'Dell', 'Lenovo', 'Acer'].map((option) {
          return DropdownMenuItem(
            value: option,
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
              decoration:const  BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Text(option),
            ),
          );
        }).toList(),
        selectedItemBuilder: (con) {
          return <String>['Macbook', 'Dell', 'Lenovo', 'Acer'].map((m) {
            return Text(
              m,
            );
          }).toList();
        });
  }
}
