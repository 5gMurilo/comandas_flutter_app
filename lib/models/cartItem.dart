import 'package:comandas_app/models/foods_model.dart';

class CartItem { 
  final FoodsModel food;
  final int quantity;

  CartItem({
    required this.food,
    required this.quantity
  });

  
}