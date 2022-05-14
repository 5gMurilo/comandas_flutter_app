class ComandaModel {
  final String id;
  final dynamic detalhes;
  final bool pronto;
  final double valorFinal;
  final String nomeCliente;

  ComandaModel({
    required this.id,
    required this.detalhes,
    required this.valorFinal,
    required this.nomeCliente,
    required this.pronto,
  });
}
