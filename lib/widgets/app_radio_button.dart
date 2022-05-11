import 'package:flutter/material.dart';

class AppRadioButton extends StatefulWidget {
  final int? index;
  final String? title;
  final Color? color;
  final void Function()? onPressed;
  
  const AppRadioButton({ 
    Key? key, 
    this.index,
    this.title, 
    this.color,
    this.onPressed
  }) : super(key: key);

  @override
  State<AppRadioButton> createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  // int index get => widget.index;
  int? get index => widget.index; 
  String? get title => widget.title; 
  Color? get color => widget.color; 

  @override
  Widget build(BuildContext context) { 
    int value = 0; 
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8
      ),
      child: ElevatedButton( 
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Text(
          title ?? "",
          style: TextStyle(
            // color: widget.color
          ),
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // borderSide:
        //   BorderSide(color: (value == index) ? Colors.green : Colors.black
        // ),
      ),
    );
  } 
}
 