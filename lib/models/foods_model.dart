class FoodsModel {
  final String? id;
  final String nome;
  final String categoria;
  final double valor;

  FoodsModel({
    this.id,
    required this.nome,
    required this.categoria,
    required this.valor,
  });


  @override
  String toString() {

    return nome;
  }
}
