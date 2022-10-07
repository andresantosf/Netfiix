import 'package:flutter/material.dart';

class ButtonDefault extends StatefulWidget {
  final String label;
  Color? cor;
  void Function()? aoClicar;
   ButtonDefault({ Key? key, required this.label, this.cor, this.aoClicar }) : super(key: key);

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: widget.aoClicar,
              child: Text(
                widget.label,
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: widget.cor ?? Colors.red, minimumSize: const Size(100, 50)),
            );
  }
}