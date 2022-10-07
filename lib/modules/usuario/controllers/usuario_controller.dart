import 'package:flutter/material.dart';
import 'package:netflixes/modules/usuario/models/usuario_model.dart';
import 'package:netflixes/modules/usuario/repositories/usuario_repository.dart';

class UsuarioControler extends ChangeNotifier {
  final nome = TextEditingController();
  final senha = TextEditingController();
  final email = TextEditingController();
  final _repository = UsuarioRepository();

  void salvarOnPressed(
      {required VoidCallback sucesso,
      required VoidCallback? Function(String motivo) falha}) async {
    try {
      //Criar o Modelo (entidade)
      final usuario = UsuarioModel(nome: nome.text, senha: senha.text, email: email.text);

      //Chamar o repositório
      await _repository.incluir(usuario);
      final incluido = await _repository.selecionar(usuario.email ?? '');
      sucesso();
    } catch (e) {
      falha(e.toString());
    }
  }
}
