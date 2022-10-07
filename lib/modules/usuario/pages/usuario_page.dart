import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:netflixes/modules/usuario/controllers/usuario_controller.dart';
import 'package:netflixes/shared/components/botao/padrao_button.dart';
import 'package:netflixes/shared/components/campo_formulario/campo_form.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final _controller = UsuarioControler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de usuários'),
        ),
        body: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CampoForm(
                  label: 'Nome:',
                  ajuda: 'Ex.: Fulano de tal',
                  controller: _controller.nome,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CampoForm(
                  label: 'E-mail',
                  ajuda: 'Ex.: exemplo@mail.com',
                  controller: _controller.email,
                  teclado: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CampoForm(
                  label: 'Senha:',
                  ajuda: '',
                  controller: _controller.senha,
                  isSenha: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonDefault(
                  label: 'Salvar',
                  cor: Colors.blue,
                  aoClicar: () {
                    _controller.salvarOnPressed(sucesso: () {
                      Navigator.pop(context);
                    }, falha: (motivo) {
                      MotionToast.error(
                        title: const Text(
                          'Error',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        description: Text(motivo),
                        animationType: AnimationType.fromLeft,
                        position: MotionToastPosition.top,
                        barrierColor: Colors.black.withOpacity(0.3),
                        width: 300,
                        height: 80,
                        dismissable: false,
                      ).show(context);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonDefault(
                  label: 'Cancelar',
                  cor: Color.fromARGB(255, 99, 95, 89),
                  aoClicar: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
