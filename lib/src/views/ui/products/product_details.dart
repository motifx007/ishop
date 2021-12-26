import 'package:flutter/material.dart';
import 'package:ishop/src/views/widgets/appbar.dart';

class ProductDetails extends StatefulWidget {
  final String? mainImage;
  const ProductDetails({Key? key, this.mainImage}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SimpleAppBar(),
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      // color: Colors.yellow,
      height: height / 4,
      child: Image.network(
        widget.mainImage!,
        // alignment: Alignment.centerLeft,
      ),
    );
  }
}
