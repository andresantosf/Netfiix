import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonDefault extends StatefulWidget {
  final String label;
  Color? color;
  void Function()? aoClicar;
  ButtonDefault({Key? key, required this.label, this.color, this.aoClicar}) : super(key: key);

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.aoClicar, 
        child: Text(widget.label),
        style: ElevatedButton.styleFrom(
          primary: widget.color?? Colors.red,
        ),
    );
  }
}