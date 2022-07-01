
import '../dados/sistema_arquivos.dart';
import '../modelo/tarefa.dart';

class GerenciadorTarefas {
  List<Tarefa> _tarefas = [];
  final SistemaArquivos _sistemaArquivos = SistemaArquivos('tarefas.json');

  GerenciadorTarefas() {
    var listaFutura = _sistemaArquivos.ler();
    listaFutura.then((tarefas) => _tarefas = tarefas);
  }

  List<Tarefa> get tarefas => _tarefas;

  void incluirTarefa(String descricao) {
    _tarefas.add(Tarefa(descricao: descricao));
    _sistemaArquivos.salvar(_tarefas);
  }

  void removeTarefa(int indice) {
    _tarefas.removeAt(indice);
    _sistemaArquivos.salvar(_tarefas);
  }

  void atualizarTarefa(Tarefa tarefa, int indice) {
    _tarefas[indice] = tarefa;
    _sistemaArquivos.salvar(_tarefas);
  }
}
