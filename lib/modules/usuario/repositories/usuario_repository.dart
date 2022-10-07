import 'dart:developer';

import 'package:netflixes/modules/usuario/models/usuario_model.dart';
import 'package:netflixes/modules/usuario/repositories/dataSource/memoria.dart';

import 'dataSource/datarsource.dart';

class UsuarioRepository{
  final DataSourceBase? _db = memoria();

  Future<void> incluir(UsuarioModel usuario) async{ 
    //Validações
    usuario.isValid();
    //Persistencia
    _db!.incluir(usuario.toMap());
  }
  Future<void> excluir(UsuarioModel usuario) async{
    _db!.excluir(usuario.toMap());
  }
  Future<void> alterar(UsuarioModel usuario) async{
    usuario.isValid();
    _db!.alterar(usuario.toMap());
  }
  Future<UsuarioModel?> selecionar(String email) async{
    final map = await _db!.selecionar(email); 
    if (map == null){
      return null;
    }
    return UsuarioModel.fromMap(map);
  }
  List<UsuarioModel> selecionarTodos(){
    final maps = _db!.selecionarTodos();
    var retorno = <UsuarioModel>[];
    for (var map in maps) {
      final usuario = UsuarioModel.fromMap(map);
      retorno.add(usuario);
    }
     return retorno;
  }
}