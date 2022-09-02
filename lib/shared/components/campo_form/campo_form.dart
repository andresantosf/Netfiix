import 'package:flutter/material.dart';

class CampoForm extends StatefulWidget {
  final String label;
  final String ajuda;
  final TextEditingController controller;
  final bool senha;
  final IconData icon;
  IconButton? suffix;
  TextInputType? teclado;

  CampoForm({ Key? key,required this.label, required this.ajuda, required this.controller, required this.icon, required this.senha, this.suffix, this.teclado }) : super(key: key);

  @override
  State<CampoForm> createState() => _CampoFormState();
}

class _CampoFormState extends State<CampoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(8.0),
          child:Text(widget.label,
            style: TextStyle(color: Colors.white),),
        ),

        Theme(
          data: ThemeData(
          primarySwatch: Colors.red,
          ),
          child:TextFormField(
            controller: widget.controller,
            keyboardType: widget.teclado ?? TextInputType.text,
            obscureText: widget.senha,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(widget.icon),
              label: Text(widget.ajuda),
              border: OutlineInputBorder(),
              hintText: widget.ajuda,
              suffixIcon: widget.suffix,
              
            ),
          ),
        ),
      ],
    );
  }
}