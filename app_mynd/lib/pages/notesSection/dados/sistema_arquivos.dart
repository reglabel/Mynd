import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import '../modelo/tarefa.dart';

class SistemaArquivos {
  late String nomeArquivo;

  SistemaArquivos(this.nomeArquivo);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _obterArquivo async {
    final path = await _localPath;
    return File('$path/tarefas.json');
  }


  Future<void> salvar(List<Tarefa> tarefas) async {
    var lista = [];

    for (Tarefa tarefa in tarefas) {
      lista.add(tarefa.paraJson());
    }

    String docJson = jsonEncode(lista);
    File arquivo = await _obterArquivo;
    await arquivo.writeAsString(docJson);
  }

  Future<List<Tarefa>> ler() async {
    File arquivo = await _obterArquivo;
    //print('Arquivo: ${arquivo.path}');

    try {
      String arqJson = await arquivo.readAsString();
      List lista = jsonDecode(arqJson);
      List<Tarefa> itens = [];
      for (var item in lista) {
        itens.add(Tarefa.doJson(item as Map<String, dynamic>));
      }
      return itens;
    } catch (e) {
      return [];
    }
  }
}
