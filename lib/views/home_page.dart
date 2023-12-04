import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_contatos/controller/usuario_controller.dart';
import '../widgets/app_bar_contatos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c = Get.put(UsuarioController());
  String nomeDigitado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(0, 55),
        child: AppBarContatos(
          title: 'Mensagens',
          icon: Icons.person,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 18, left: 18, top: 15, bottom: 10),
            child: TextFormField(
              onChanged: (String value) {
                setState(() {
                  nomeDigitado = value;
                  c.pesquisarUsuario(value);
                });
              },
              controller: c.controllerName,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: 'Pesquisar',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: c.listaFazia.isEmpty || nomeDigitado.isEmpty
                ? Center(
                    child: Text('Usuário $nomeDigitado não encontrado'),
                  )
                : ListView.builder(
                    itemCount: c.listaFazia.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            maxRadius: 24,
                            backgroundImage:
                                AssetImage(c.usuarios[index].image),
                          ),
                          title: Text(
                            c.listaFazia[index].name,
                            style: const TextStyle(fontSize: 19),
                          ),
                          subtitle: Text(c.listaFazia[index].subTitle),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
