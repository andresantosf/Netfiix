import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:netflixes/modules/usuario/repositories/dataSource/memoria.dart';

import '../../usuario/models/usuario_model.dart';
import '../../usuario/repositories/usuario_repository.dart';

class LoginController extends ChangeNotifier{
  
  final email = TextEditingController();
  final senha = TextEditingController();
  
  final _usuarioRepository = UsuarioRepository();

  Future<void> entrarOnPressed({
    required VoidCallback sucesso,
    required VoidCallback? Function(String motivo) falha}) async {
    
    final validar = await _usuarioRepository.selecionar(email.text);
    if (senha.text == validar?.senha){
      sucesso();
    }else{
      falha('Usuário e senha inválidos');
    }
  }
}