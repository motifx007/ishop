import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/cart/cart_bloc.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';
import 'package:ishop/src/business_logic/presets/product_list_preset.dart';
import 'package:ishop/src/views/ui/checkout/checkout.dart';
import 'package:ishop/src/views/widgets/appbar.dart';

import 'product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late List<ProductCategory> _productListRespone = <ProductCategory>[];
  late double height, width;
  late final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);

  @override
  void initState() {
    super.initState();
    _productListRespone = getProductList();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SimpleAppBar(
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
    );
  }

  Widget _scaffoldBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerView(title: 'i-Shop'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _titleView(text: _productListRespone[index].name),
                  _productListView(products: _productListRespone[index].products),
                ],
              );
            },
            itemCount: _productListRespone.length,
          ),
        ),
      ],
    );
  }

  Widget _titleView({
    String? text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text ?? '', style: Theme.of(context).textTheme.headline6),
          const Spacer(),
          TextButton(
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _productListView({List<Products>? products}) {
    return SizedBox(
      height: height / 2,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => _cartBloc,
                          child: ProductDetails(
                            products: products![index],
                          ),
                        )),
              );
            },
            child: SizedBox(
              // width: constraints.maxWidth / 3,
              width: width / 6.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // color: Colors.yellow,
                    height: height / 4,
                    child: Image.network(
                      products![index].mainImage!,
                      // alignment: Alignment.centerLeft,
                    ),
                  ),
                  _productName(title: products[index].name),
                  _productPrice(title: products[index].price.toString()),
                ],
              ),
            ),
          );
        },
        itemCount: products!.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  Widget _headerView({String? title}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Apple products shop at Southern Hill',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _productName({String? title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.subtitle2,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _productPrice({String? title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        '₹' + (title ?? ''),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
