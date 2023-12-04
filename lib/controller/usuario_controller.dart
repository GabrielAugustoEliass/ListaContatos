import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_contatos/model/usuario_model.dart';

class UsuarioController extends GetxController {
  final controllerName = TextEditingController();

  RxList<UsuarioModel> usuarios = <UsuarioModel>[
    UsuarioModel(
        image: 'images/person 1.png',
        name: 'Aurora Silva',
        subTitle: 'Seja Bem vindo a Nova York'),
    UsuarioModel(
        image: 'images/person 2.png',
        name: 'Rafael Oliveira',
        subTitle: 'Quantos anos você tem?'),
    UsuarioModel(
        image: 'images/person 3.png',
        name: 'Luna Pereira',
        subTitle: 'A onde você morava?'),
    UsuarioModel(
        image: 'images/person 4.png',
        name: 'Enzo Costa',
        subTitle: 'Você ja estudou Inglês?'),
    UsuarioModel(
        image: 'images/person 5.png',
        name: 'Valentina Santos',
        subTitle: 'Qual a sua idade a 4 anos atrás?'),
    UsuarioModel(
        image: 'images/person 6.png',
        name: 'Noah Souza',
        subTitle: 'Te vejo as 10 da noite! Ate la'),
    UsuarioModel(
        image: 'images/person 7.png',
        name: 'Maya Lima',
        subTitle: 'Vamos para o park de diversão hoje?'),
  ].obs;

  List<UsuarioModel> listaFazia = [];

  void pesquisarUsuario(String value) {
    if (value.isEmpty) {
      listaFazia = List.from(usuarios);
    } else {
      listaFazia = usuarios
          .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      update();
    }
  }
}
