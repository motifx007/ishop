part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProduct extends CartEvent {
  final Products products;

  AddProduct({required this.products});
  @override
  List<Object?> get props => [products];
}

class UpdateProduct extends CartEvent {
  final Products products;

  UpdateProduct({required this.products});
  @override
  List<Object?> get props => [products];
}

class DeleteProduct extends CartEvent {
  final String id;

  DeleteProduct({required this.id});
  @override
  List<Object?> get props => [id];
}

class GetCartList extends CartEvent {}
