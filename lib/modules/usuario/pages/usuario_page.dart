import 'package:flutter/material.dart';
import 'package:netfiif/shared/components/botao/padrao_button.dart';
import 'package:netfiif/shared/components/campo_form/campo_form.dart';

final _tLogin = TextEditingController();
final _tSenha = TextEditingController();

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({ Key? key }) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
    bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('André Santos'),
        centerTitle: true,
        backgroundColor: Colors.red
      ),
      body:Form(
        child: ListView(children: [
          
          Padding(padding: const EdgeInsets.all(8.0),
          child: CampoForm(
            label: "Nome", 
            ajuda: "André Santos",
            icon: Icons.email, 
            controller: _tLogin, 
            senha:false, 
            teclado: TextInputType.text),
          ),
          
          Padding(padding: const EdgeInsets.all(8.0),
          child: CampoForm(
            label: "Senha", 
            ajuda: "123456", 
            icon: Icons.person, 
            controller: _tLogin, 
            senha: obscureText, 
            suffix: IconButton(
              icon: Icon(
                obscureText
                ? Icons.visibility_off
                : Icons.visibility,
                ),
              onPressed: () {
                setState(() {
                    obscureText = !obscureText;
                });
              },
            ),
            teclado: TextInputType.text),
          ),

          Padding(padding: const EdgeInsets.all(8.0),
            child:ButtonDefault(label: "cu",color: Colors.blue, aoClicar: (){}),
          ),
      
        ]),
      )
    );
  }
}