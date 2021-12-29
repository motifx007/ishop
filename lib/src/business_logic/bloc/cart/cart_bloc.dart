// ignore_for_file: unused_element

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';

part 'cart_event.dart';
part 'cart_state.dart';

List<Products>? products = [];

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // on<CartInitial>((event, emit) {});

    on<AddProduct>((event, emit) {
      products?.add(event.products);
      emit(AddProductSuccess(products: products));
    });

    on<UpdateProduct>((event, emit) {
      for (Products item in products!) {
        if (item.id == event.products.id) {
          products![products!.indexOf(item)].quantity = event.products.quantity;
        }
      }
      emit(UpdateProductSuccess(products: products));
    });

    on<DeleteProduct>((event, emit) {
      for (Products item in products!) {
        if (item.id == event.id) {
          products!.remove(item);
          break;
        }
      }
      emit(DeleteProductSuccess());
    });

    on<GetCartList>((event, emit) {
      emit(CartListSuccess(products: products));
    });

    on<DeleteAllProducts>((event, emit) {
      products!.clear();
      emit(DeleteAllProductsSuccess());
    });
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    // throw UnimplementedError();
    // return json['value'];
    List<Products>? _products;
    if (json['cart'] != null) {
      _products = <Products>[];
      json['cart'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    products = _products;
    return CartListSuccess(products: _products);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    // TODO: implement toJson
    // throw UnimplementedError();
    if (state is CartListSuccess) {
      // final Map<String, dynamic> data = <String, dynamic>{};
      // if (this.data != null) {
      // data['data'] = state.products?.map((v) => v.toJson()).toList();
      // }
      return {"cart": state.products?.map((v) => v.toJson()).toList()};
    }
  }
}
