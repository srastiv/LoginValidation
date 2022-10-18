import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({Key? key, this.selection}) : super(key: key);
  String? selection;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isStrechedDropDown = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: kLightBlue,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
          isExpanded: true,
          isDense: true,
          value: widget.selection,
          icon: GestureDetector(
            onTap: () {
              setState(() {
                isStrechedDropDown = !isStrechedDropDown;
              });
            },
            child: Icon(
              isStrechedDropDown ? Icons.arrow_upward : Icons.arrow_drop_down,
              color: kBlack,
            ),
          ),
          iconSize: 35,
          underline: Container(
            height: 2,
            // color: kLightBlue,
          ),
          hint: const Text("Select"),
          elevation: 10,
          onChanged: (val) => setState(() => widget.selection = val.toString()),
          items: <String>['Macbook', 'Dell', 'Lenovo', 'Samsung'].map((option) {
            return DropdownMenuItem(
              value: option,
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                decoration: const BoxDecoration(
                  border: Border(
                      //  top: BorderSide(color: kLightBlue, width: 3),
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
          }),
    );
  }
}
