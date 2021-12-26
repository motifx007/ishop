import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/cart/cart_bloc.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';
import 'package:ishop/src/views/widgets/button.dart';

class CartButton extends StatefulWidget {
  final Products products;
  const CartButton({Key? key, required this.products}) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  late final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);

  @override
  Widget build(BuildContext context) {
    return _cartButton();
  }

  Widget _cartButton() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxWidth / 8,
        child: BlocBuilder<CartBloc, CartState>(
          bloc: _cartBloc,
          builder: (context, state) {
            if (state is AddProductSuccess) {
              for (Products item in state.products!) {
                if (item.id == widget.products.id) {
                  return Row(
                    children: [
                      Expanded(
                          child: _button(
                        title: '-',
                        onPressed: () {},
                      )),
                      _cartCount(state: state),
                      Expanded(
                          child: _button(
                        title: '+',
                        onPressed: () {},
                      )),
                    ],
                  );
                }
              }

              return _button(
                title: 'ADD TO CART',
                onPressed: () {
                  final _products = widget.products;
                  _products.quantity = 1;
                  _cartBloc.add(AddProduct(products: _products));
                },
              );
            }
            return _button(
              title: 'ADD TO CART',
              onPressed: () {
                final _products = widget.products;
                _products.quantity = 1;
                _cartBloc.add(AddProduct(products: _products));
              },
            );
          },
        ),
      );
    });
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
}
