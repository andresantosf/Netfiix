import 'package:flutter/material.dart';

class compbotao extends StatefulWidget {
  final Color cor;
  final Size size;
  Function()? aoclicar;
  final Text texto;



  compbotao({ Key? key,
  required this.cor,
  required this.texto,
  required this.size,
  this.aoclicar,
  
   }) : super(key: key);

  @override
  State<compbotao> createState() => _compbotaoState();
}

class _compbotaoState extends State<compbotao> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: widget.size,
        primary: widget.cor,
      ),
      child: widget.texto,
      onPressed: widget.aoclicar,
    );
  }
}