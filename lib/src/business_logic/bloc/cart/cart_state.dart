part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class AddProductSuccess extends CartState {
  final List<Products>? products;

  AddProductSuccess({required this.products});
  @override
  List<Object?> get props => [products];
}

class UpdateProductSuccess extends CartState {
  final List<Products>? products;

  UpdateProductSuccess({required this.products});
  @override
  List<Object?> get props => [products];
}

class DeleteProductSuccess extends CartState {}

class CartListSuccess extends CartState {
  final List<Products>? products;

  CartListSuccess({required this.products});
  @override
  List<Object?> get props => [products];
}

class DeleteAllProductsSuccess extends CartState {}