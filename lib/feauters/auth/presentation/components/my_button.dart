import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({
    //
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //
      onTap: widget.onTap,
      child: Container(
        //paddinge inside
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          //color of button
          color: Theme.of(context).colorScheme.tertiary,
          //curved corners
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          //
          child: Text(
            widget.text,
            style: TextStyle(
              //
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
