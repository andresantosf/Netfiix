import 'package:flutter/material.dart';
import 'package:netflixes/modules/home/controllers/home_controller.dart';

import 'package:netflixes/modules/usuario/models/usuario_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    List<UsuarioModel> listUsuario =  _controller.carregaDados();

    
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'),),
      body: ListView.builder(
        itemCount: listUsuario.length,
        itemBuilder: (context, indice){
          final usuario = _controller.usuarios[indice];
          return ListTile(
            title: Text(usuario.nome ?? 'Sem Nome'),
            subtitle: Text(usuario.email ?? 'Sem Email'),
          );
        }),      
    );
  }
}