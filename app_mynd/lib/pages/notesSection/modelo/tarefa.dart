class Tarefa {
  late String descricao;
  late bool concluida;

  Tarefa({required this.descricao, this.concluida = false});

  Tarefa.doJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    concluida = json['concluida'];
  }

  Map paraJson() => {'descricao': descricao, 'concluida': concluida};
}
