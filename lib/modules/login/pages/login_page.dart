import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflixes/modules/home/pages/home_page.dart';
import 'package:netflixes/modules/login/controllers/login_controller.dart';
import 'package:netflixes/modules/usuario/pages/usuario_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _mostrarSenha = false;
  final _controller = LoginController();

  @override
  void initState() {
    super.initState();
    _mostrarSenha = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      body: ListView(
        children: [
          /*
          Image.asset(
            'assets/image/logo.png',
            width: 200,
            height: 200,
          ),*/

          //Usuario
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Theme(
              data: ThemeData(
                primarySwatch: Colors.red,
              ),
              child: TextFormField(
                controller: _controller.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Ex.: exemplo@mail.com',
                    label: Text('E-mail'),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),

          //Senha
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Theme(
              data: ThemeData(
                primarySwatch: Colors.red,
              ),
              child: TextFormField(
                controller: _controller.senha,
                obscureText: _mostrarSenha,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _mostrarSenha = !_mostrarSenha;
                          });
                        },
                        icon: _mostrarSenha == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintText: 'Ex.: 123456',
                    label: Text('Senha'),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),

          //Botão Entrar
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: ElevatedButton(
              onPressed: () {
                _controller.entrarOnPressed(sucesso: () {
                  final rota = MaterialPageRoute(builder: (context) => const HomePage());

                  Navigator.of(context).push(rota);
                }, falha: (motivo) {
                  print('Deu erro: ' + motivo);
                });
              },
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, minimumSize: const Size(100, 50)),
            ),
          ),

          //Criar Conta
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: TextButton(
              onPressed: () {
                final rota = MaterialPageRoute(
                    builder: (context) => const UsuarioPage());

                Navigator.of(context).push(rota);
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //Criar Con
        ],
      ),
    );
  }
}
