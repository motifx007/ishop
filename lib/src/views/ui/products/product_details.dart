import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/cart/cart_bloc.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';
import 'package:ishop/src/views/ui/checkout/checkout.dart';
import 'package:ishop/src/views/widgets/appbar.dart';

import 'cart_button.dart';

class ProductDetails extends StatefulWidget {
  final Products products;
  const ProductDetails({Key? key, required this.products}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late double height, width;
  // late final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SimpleAppBar(
        leadingType: LeadingType.back,
        onPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckOut()),
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: _scaffoldBody(),
      bottomNavigationBar: _cartButton(),
    );
  }

  Widget _scaffoldBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            // color: Colors.yellow,
            height: height / 1.5,
            child: Center(
              child: Image.network(
                widget.products.mainImage!,
                // alignment: Alignment.centerLeft,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          _productName(title: widget.products.name),
          _divider(),
          _description(),
          _divider(),
          _productPrice(title: widget.products.price.toString()),
          _tax(percentage: widget.products.taxPercentage.toString()),
          // _cartButton(),
        ],
      ),
    );
  }

  Widget _productName({String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headline4,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey[500]),
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _productPrice({String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '₹' + (title ?? ''),
        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey[800]),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _tax({String? percentage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Tax: ' + (percentage ?? '') + '%',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey[700]),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(),
    );
  }

  Widget _cartButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      // child: BlocProvider(
      //   create: (context) => _cartBloc,
      //   child: CartButton(products: widget.products,),
      // ),
      child: CartButton(products: widget.products,),
    );
  }
}
