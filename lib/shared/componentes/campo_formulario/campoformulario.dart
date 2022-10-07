import 'package:flutter/material.dart';

class camposform extends StatefulWidget {
  final String label;
  final String ajuda;
  final TextEditingController controller; 
  final bool senha;
  TextInputType? teclado;

   camposform({ Key? key, 
   required this.label, 
   required this.ajuda, 
   required this.controller,
   required this.senha,
   this.teclado }) : super(key: key);



  @override
  State<camposform> createState() => _camposformState();
}

class _camposformState extends State<camposform> {

  bool password = true;
  void initState() {
    super.initState();
    password = true;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget. label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17
            ),
            ),
        Theme(
          data: ThemeData(primarySwatch: Colors.red),
          child: TextFormField(
            obscureText: widget.senha == true ?password :false,
                    keyboardType: widget.teclado,
                    decoration: InputDecoration(
                      suffixIcon: widget.senha == true ? IconButton(
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        icon: password == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)): null,
                      labelStyle: TextStyle(height: 3),                   
                      hintText: widget.ajuda,                    
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
        ),
      ],
    );
  }
}