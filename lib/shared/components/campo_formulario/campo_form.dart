import 'package:flutter/material.dart';

class CampoForm extends StatefulWidget {
  final String label;
  final String ajuda;
  final TextEditingController controller;
  TextInputType? teclado;
  bool? isSenha;
  bool mostrarSenha = false;

  CampoForm({ Key? key,
    required this.label, 
    required this.ajuda,
    required this.controller,
    this.teclado,
    this.isSenha }) : super(key: key){
      mostrarSenha = this.isSenha ?? true;
    }

  @override
  State<CampoForm> createState() => _CampoFormState();
}

class _CampoFormState extends State<CampoForm> {
 
  
  bool ehCampoDeSenha(){
    return widget.isSenha != null && widget.isSenha == true;
  }

  bool habilitarObscureText(){
    if (ehCampoDeSenha()){
      return widget.mostrarSenha;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFormField(
              controller: widget.controller,
              obscureText: habilitarObscureText(),
              keyboardType:  widget.teclado ?? TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit),
                  hintText: widget.ajuda,
                  border: const OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: ehCampoDeSenha() ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.mostrarSenha = !widget.mostrarSenha;
                          });
                        },
                        icon: widget.mostrarSenha == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)): null),
            )
      ],
    );
  }
}