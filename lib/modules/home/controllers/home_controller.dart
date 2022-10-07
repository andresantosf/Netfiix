import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:netflixes/modules/usuario/models/usuario_model.dart';
import 'package:netflixes/modules/usuario/repositories/usuario_repository.dart';

class HomeController extends ChangeNotifier{
  final _usuarioRepository = UsuarioRepository();

  ValueNotifier<List<UsuarioModel>> usuarioDataSourceNotifier =
      ValueNotifier<List<UsuarioModel>>([]);
      List<UsuarioModel> usuarios = [];

    List<UsuarioModel> carregaDados() {
      usuarios = _usuarioRepository.selecionarTodos();

      return usuarios;
    }


}