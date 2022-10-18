import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Widget? pageToShow;
  final Color color;
  final void Function()? onpressed;

  const SubmitButton({
    Key? key,
    this.pageToShow,
    required this.color,
    this.onpressed,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 328,
      child: ElevatedButton(
        onPressed: widget.onpressed,
        
        // {
        //   Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => widget.pageToShow!,

            
        //   ));
        // },
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("Submit"),
      ),
    );
  }
}
