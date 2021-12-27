// ignore_for_file: unused_element

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    List<Products>? products = [];
    on<AddProduct>((event, emit) {
      products.add(event.products);
      emit(AddProductSuccess(products: products));
    });

    on<UpdateProduct>((event, emit) {
      for (Products item in products) {
        if (item.id == event.products.id) {
          products[products.indexOf(item)].quantity = event.products.quantity;
        }
      }
      emit(UpdateProductSuccess(products: products));
    });

    on<DeleteProduct>((event, emit) {
      for (Products item in products) {
        if (item.id == event.id) {
          products.remove(item);
          break;
        }
      }
      emit(DeleteProductSuccess());
    });

    on<GetCartList>((event, emit) {
      emit(CartListSuccess(products: products));
    });
  }
}
