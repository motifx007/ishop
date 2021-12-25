import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _titleView(text: 'Products');
      },
      itemCount: 1,
    );
  }

  _titleView({
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
}
