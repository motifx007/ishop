import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/cart/cart_bloc.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';
import 'package:ishop/src/views/widgets/button.dart';

class CartButtonCheckOut extends StatefulWidget {
  final Products products;
  const CartButtonCheckOut({Key? key, required this.products}) : super(key: key);

  @override
  _CartButtonCheckOutState createState() => _CartButtonCheckOutState();
}

class _CartButtonCheckOutState extends State<CartButtonCheckOut> {
  late final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);
  List<Products>? _products = [];

  @override
  void initState() {
    super.initState();
    _cartBloc.add(GetCartList());
  }

  @override
  Widget build(BuildContext context) {
    return _cartButton();
  }

  Widget _cartButton() {
    return BlocBuilder<CartBloc, CartState>(
      // bloc: _cartBloc,
      builder: (context, state) {
        if (state is CartListSuccess) {
          for (Products item in state.products!) {
            if (item.id == widget.products.id) {
              // return Row(
              //   children: [
              //     Expanded(
              //         child: _button(
              //       title: '-',
              // onPressed: () {
              //   final _products = item;
              //   _products.quantity = item.quantity! - 1;
              //   if (_products.quantity == 0) {
              //     _cartBloc.add(DeleteProduct(id: _products.id!));
              //   } else {
              //     _cartBloc.add(UpdateProduct(products: _products));
              //   }
              // },
              //     )),
              //     _cartCount2(count: item.quantity!),
              //     Expanded(
              //       child: _button(
              //         title: '+',
              // onPressed: () {
              //   final _products = item;
              //   _products.quantity = item.quantity! + 1;
              //   _cartBloc.add(UpdateProduct(products: _products));
              // },
              //       ),
              //     ),
              //   ],
              // );
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      final _products = item;
                      _products.quantity = item.quantity! - 1;
                      if (_products.quantity == 0) {
                        _cartBloc.add(DeleteProduct(id: _products.id!));
                      } else {
                        _cartBloc.add(UpdateProduct(products: _products));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[300],
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item.quantity!.toString(),
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey[800]),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      final _products = item;
                      _products.quantity = item.quantity! + 1;
                      _cartBloc.add(UpdateProduct(products: _products));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[300],
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          // return _button(
          //   title: 'ADD TO CART',
          //   onPressed: () {
          //     final _products = widget.products;
          //     _products.quantity = 1;
          //     _cartBloc.add(AddProduct(products: _products));
          //   },
          // );
        }
        if (state is AddProductSuccess) {
          _cartBloc.add(GetCartList());
        }
        if (state is UpdateProductSuccess) {
          _cartBloc.add(GetCartList());
        }
        if (state is DeleteProductSuccess) {
          _cartBloc.add(GetCartList());
          // return _button(
          //   title: 'ADD TO CART',
          //   onPressed: () {
          //     final _products = widget.products;
          //     _products.quantity = 1;
          //     _cartBloc.add(AddProduct(products: _products));
          //   },
          // );
        }
        return SizedBox(
          height: 0,
        );
      },
    );
  }

  Widget _button({String? title, VoidCallback? onPressed}) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 4)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ))),
      onPressed: onPressed,
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _cartCount({required AddProductSuccess state}) {
    int count = 0;
    if (state.products != null) {
      for (Products item in state.products!) {
        if (item.id == widget.products.id) {
          count = item.quantity!;
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey[800]),
      ),
    );
  }

  Widget _cartCount2({required int count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey[800]),
      ),
    );
  }
}
