import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/src/business_logic/bloc/cart/cart_bloc.dart';
import 'package:ishop/src/views/ui/checkout/cart_button_checkout.dart';
import 'package:ishop/src/views/widgets/widgets.dart';
import 'package:ishop/src/business_logic/model/product_list.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> with TickerProviderStateMixin {
  late double height, width;
  late final CartBloc _cartBloc = BlocProvider.of<CartBloc>(context);
  List<Products>? _products = [];
  double _subTotalCost = 0.0;
  double _totalCost = 0.0;
  double _shippingCost = 100.00;
  late AnimationController controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartBloc.add(GetCartList());
    // _subTotal();
    // _total();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SimpleAppBar(
        leadingType: LeadingType.back,
        onPressed: () => Navigator.pop(context),
      ),
      body: _scaffoldBody(),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartListSuccess) {
          return _checkoutButton(
              title: 'CheckOut',
              onPressed: state.products!.isEmpty ? null : () {
                _cartBloc.add(DeleteAllProducts());
                positiveSnackBar(
                  message: 'Order Placed Succesfully',
                  context: context,
                );
              });
          }
          return SizedBox(height: 0,);
        },
      ),
    );
  }

  Widget _scaffoldBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(title: 'My Cart'),
          _productView(),
          const SizedBox(
            height: 16,
          ),
          _heading(title: 'Delivery Location'),
          _deliveryLocation(),
          const SizedBox(
            height: 16,
          ),
          _heading(title: 'Payment Method'),
          _paymentMethod(),
          const SizedBox(
            height: 16,
          ),
          _heading(title: 'Order Info'),
          _orderInfo(),
          const SizedBox(
            height: 16,
          ),
          // _checkoutButton(title: 'CheckOut', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _heading({String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headline6,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _productView() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartListSuccess) {
          if (state.products!.isNotEmpty) {
            _products = state.products;
            // setState(() {

            // });
            // _subTotal();
            // _total();
            return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _productItemView(products: state.products![index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                itemCount: state.products!.length);
          } else {
            return Center(child: Text('No Products Added'));
          }
        }
        if (state is UpdateProductSuccess) {
          _cartBloc.add(GetCartList());
        }
        if (state is DeleteProductSuccess) {
          _cartBloc.add(GetCartList());
        }
        return SizedBox(
          height: 0,
        );
      },
    );
  }

  Widget _productItemView({required Products products}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          // color: Colors.yellow,
          height: height / 8,
          // width: width / 4.5,
          child: Image.network(
            products.mainImage!,
            // alignment: Alignment.centerLeft,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _productName(title: products.name),
            _productPrice(title: products.price.toString()),
          ],
        ),
        Spacer(),
        // _cartButton(),
        CartButtonCheckOut(
          products: products,
        ),
      ],
    );
  }

  Widget _productName({String? title}) {
    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.subtitle2,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
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

  Widget _cartButton() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
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
            '4',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey[800]),
          ),
        ),
        InkWell(
          onTap: () {},
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

  Widget _deliveryLocation() {
    return SizedBox(
      width: width,
      height: height / 6,
      child: Center(
        child: ListTile(
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
          ),
          title: Text('2 Petre MezikVille St.'),
          subtitle: Text('0125 Sibtile'),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget _paymentMethod() {
    return SizedBox(
      width: width,
      height: height / 6,
      child: Center(
        child: ListTile(
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: Icon(
              Icons.payment,
              color: Colors.blue,
            ),
          ),
          title: Text('Cash On Delivery'),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget _orderInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartListSuccess) {
            _subTotalCost = 0.0;
            _totalCost = 0.0;

            for (Products item in _products!) {
              _subTotalCost = _subTotalCost + item.price! * item.quantity!;
            }
            _totalCost = _totalCost + _subTotalCost + (state.products!.isEmpty ? 0 : _shippingCost);
            return Column(
              children: [
                _orderSubTotal(subtotal: _subTotalCost.toString()),
                _shippingCostView(cost: state.products!.isEmpty ? '0' : _shippingCost.toString()),
                _totalView(totalCost: _totalCost.toString()),
              ],
            );
          }
          return SizedBox(
            height: 0,
          );
        },
      ),
    );
  }

  Widget _orderSubTotal({String? subtotal}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _orderText1('Subtotal'),
          const Spacer(),
          _orderText2('₹$subtotal'),
        ],
      ),
    );
  }

  Widget _shippingCostView({String? cost}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _orderText1('Shipping Cost'),
          const Spacer(),
          _orderText2('₹$cost'),
        ],
      ),
    );
  }

  Widget _totalView({String? totalCost}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _orderText1('Total'),
          const Spacer(),
          _totalText('₹$totalCost'),
        ],
      ),
    );
  }

  Widget _orderText1(String? text) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: Colors.grey,
          ),
    );
  }

  Widget _orderText2(String? text) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget _totalText(String? text) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget _checkoutButton({String? title, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth / 8,
          child: ElevatedButton(
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
          ),
        );
      }),
    );
  }

  positiveSnackBar({required BuildContext context, String? message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(_customSnackBar(
      message: message ?? '',
      color: Color(0xff4caf50),
      icon: Icons.task_alt_outlined,
      context: context,
    ));
  }

  SnackBar _customSnackBar({required String message, required Color color, required IconData icon, required BuildContext context}) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
              maxLines: 2,
            ),
          ),
        ],
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 1500),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      animation: CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
  }
}
