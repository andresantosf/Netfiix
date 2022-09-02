import 'package:flutter/material.dart';
import 'package:netfiif/modules/usuario/pages/usuario_page.dart';

final _tLogin = TextEditingController();
final _tSenha = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initially password is obscure
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 15),
          primary: Colors.red,
          fixedSize: Size(0, 60),
         );
    return Scaffold(
      backgroundColor: Colors.black,
      body:ListView(children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 80),
              child: Image.asset('assets/image/logo.png',
              width: 200,
              height: 200,),
            ),

            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Theme(
                data: ThemeData(
                primarySwatch: Colors.red,
                ),
                child:TextFormField(
                  controller: _tLogin,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                    hintText: 'exemplo@exemplo.com',
                  ),
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Theme(
                data: ThemeData(
                primarySwatch: Colors.red,
                ),
              child:TextFormField(
                controller: _tSenha,
                obscureText: !_obscureText,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.key),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                          ),
                        onPressed: () {
                          setState(() {
                              _obscureText = !_obscureText;
                          });
                        },
                        ),
                      ),
                  ),
              ),
            ),
            
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child:ElevatedButton(
              style: style,
              onPressed: () {
                _onClickLogin(context);
              },
              child: const Text('Entrar'),
            )),
            
            Padding(padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child:ElevatedButton(
              style: style,
              onPressed: () {
                final rota = MaterialPageRoute(builder: (context) => const UsuarioPage());

                Navigator.of(context).pushAndRemoveUntil(rota, (Route)=>false);
              },
              child: const Text('Cadastrar'),
            )),
      ])
    );
  }

  void _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    // ignore: avoid_print
    print("Login: $login , Senha: $senha " );  

    if(login.isEmpty || senha.isEmpty) {
      const snackbar = SnackBar(
        content: Text("Dados inválidos"),
        duration: Duration(seconds: 2),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }else if( login == "admin" && senha == "admin"){
      final rota = MaterialPageRoute(builder: (context) => const UsuarioPage());

      Navigator.of(context).pushAndRemoveUntil(rota, (Route)=>false);
    }else{
      const snackbar = SnackBar(
        content: Text("Dados inválidos"),
        duration: Duration(seconds: 2),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}