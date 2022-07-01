import 'package:flutter/material.dart';

import '../aplicacao/gerenciador_tarefa.dart';
import '../dados/sistema_arquivos.dart';
import '../modelo/tarefa.dart';

class Notas extends StatefulWidget {
  const Notas({Key? key}) : super(key: key);

  @override
  State<Notas> createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  late SistemaArquivos _sistemaArquivos;
  List<Tarefa> _tarefas = [];
  late GerenciadorTarefas gerenciadorTarefas;

  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
    gerenciadorTarefas = GerenciadorTarefas();
    setState(() {
       _tarefas = gerenciadorTarefas.tarefas;
     });

    _sistemaArquivos = SistemaArquivos('tarefas.json');

    Future<List<Tarefa>> quaseTarefas = _sistemaArquivos.ler();
    quaseTarefas.then((tarefas) {
      setState(() {
        _tarefas = tarefas;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xff121421),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Nova Nota'),
                  content: TextField(
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    controller: _controller,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _tarefas.add(Tarefa(descricao: _controller.text));
                          _sistemaArquivos.salvar(_tarefas);
                          _controller.text = '';
                        });
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                )),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add_box_rounded),
      ),
      appBar: AppBar(
        title: const Text('Suas notas'),
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        
        itemBuilder: (BuildContext contex, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            key: ValueKey<Tarefa>(_tarefas[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                gerenciadorTarefas.removeTarefa(index);
                _tarefas.removeAt(index);
                _sistemaArquivos.salvar(_tarefas);
              });
            },
            child: CheckboxListTile(
                side: BorderSide(color: Colors.white),
                title: Text(_tarefas[index].descricao, style: TextStyle(
                          color: Colors.white,)),
                value: _tarefas[index].concluida,
                onChanged: (bool? valor) {
                  setState(() {
                    _tarefas[index].concluida = valor ?? false;
                    _sistemaArquivos.salvar(_tarefas);
                     gerenciadorTarefas.atualizarTarefa(
                         gerenciadorTarefas.tarefas[index], index);
                  });
                }),
          );
        },
      ),
    );
  }
}
