


import 'datarsource.dart';

class memoria extends DataSourceBase{
  static List<Map<String, dynamic>> tableUsuario = [];

  @override
  Future<void> alterar(Map<String, dynamic> usuario)async {
    for (var i = 0; i < tableUsuario.length; i++) {
      if (tableUsuario[i]['email'] == usuario['email']){

        tableUsuario[i]['nome'] = usuario['nome'];        
        tableUsuario[i]['senha'] = usuario['senha'];
        break;
      }
      
    }
  }

  @override
  Future<void> excluir(Map<String, dynamic> usuario)async {
    tableUsuario.remove(usuario);
  }

  @override
  Future<void> incluir(Map<String, dynamic> usuario)async {
    tableUsuario.add(usuario);
  }

  @override
  Future<Map<String, dynamic>> selecionar(String email)async {
    for (var usuario in tableUsuario) {
      if (usuario['email'] == email);
      return usuario;
    }return Map();
  }

  @override
  List<Map<String, dynamic>> selecionarTodos() {
    return tableUsuario;
  }

}