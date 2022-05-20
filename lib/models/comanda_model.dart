class ComandaModel {
  final String? id;
  final List<Map<dynamic, dynamic>> detalhes;
  final bool pronto;
  final double valorFinal;
  final String nomeCliente;

  ComandaModel({
    this.id,
    required this.detalhes,
    required this.valorFinal,
    required this.nomeCliente,
    required this.pronto,
  });
}
